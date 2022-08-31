my $basedir = config()<basedir>;
directory ".cache";

bash q:to /HERE/, %( description => "archive rakudo distribution", cwd => "{$*CWD}/$basedir/" );
  set -x
  tar --exclude-vcs  -czf ../.cache/rakudo.tar.gz rakudo 
  ls -lh ../.cache/rakudo.tar.gz 
HERE
