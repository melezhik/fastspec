my $basedir = config()<basedir>;

directory ".cache";

#copy(
#  "/Users/alex/.sparky/.cache/ndvrofekwbsimlazxujq.22748/.sparrowdo/scm/.cache/rakudo.tar",
#  ".cache/rakudo.tar"
#);

#exit(0);

bash q:to /HERE/, %( description => "archive rakudo distribution", cwd => "{$*CWD}/$basedir/" );
  set -x
  set -e
  tar --exclude-vcs  -cf ../.cache/rakudo.tar rakudo
  ls -lh ../.cache/rakudo.tar
  tar -tf ../.cache/rakudo.tar
HERE
