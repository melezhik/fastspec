my $basedir = config()<basedir>;
directory ".cache";

bash q:to /HERE/, %( description => "archive rakudo distribution", cwd => "{$*CWD}/$basedir/" );
  set -x
  touch foo.txt
  tar --exclude-vcs  -czf ../.cache/rakudo.tar.gz  foo.txt
  ls -lh ../.cache/rakudo.tar.gz 
HERE
