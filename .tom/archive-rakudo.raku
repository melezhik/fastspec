my $basedir = config()<basedir>;
directory ".cache";

bash q:to /HERE/, %( description => "archive rakudo distribution", cwd => "{$*CWD}/$basedir/" );
  set -x
  touch foo.txt
  tar --exclude-vcs  -cf ../.cache/rakudo.tar rakudo
  ls -lh ../.cache/rakudo.tar
  tar -tf ../.cache/rakudo.tar
HERE
