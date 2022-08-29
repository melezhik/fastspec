my $basedir = config()<basedir>;
my $worker = %*ENV<WORKER>;
my $chunk = config()<chunk>;

directory "$basedir/rakudo/t/spec";

git-scm "https://github.com/Raku/roast.git", %(
  to => "$basedir/rakudo/t/spec"
);

my @lines = "$basedir/rakudo/t/spec/spectest.data".IO.lines;

my $lines-cnt = @lines.elems;

say "spectest.data lines cnt: {$lines-cnt} | chunk size: {$chunk} | chunk num: {$worker}";

my @t; 

my $from = $chunk*($worker.Int - 1);

my $to = $from >= $lines-cnt ?? $lines-cnt - 1 !! $from + $chunk - 1;

say "chunk, process lines [$from ..$to]";

for $from .. $to   -> $i {
    @t.push: @lines[$i];
}

"$basedir/rakudo/t/spec/spectest.chunk.data".IO.spurt(@t.join("\n"));

bash q:to /HERE/, %( cwd => "{$*CWD}/$basedir/rakudo" , description => "spectest");
  export TEST_JOBS=4
  perl -Itools/lib \
  -I3rdparty/nqp-configure/lib \
  t/harness5 --moar --fudge --keep-exit-code --tests-from-file=t/spec/spectest.chunk.data
HERE
