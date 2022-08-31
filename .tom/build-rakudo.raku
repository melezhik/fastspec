my $basedir = config()<basedir>;

directory "$basedir/selfrepo";

directory-delete "$basedir/rakudo";
directory-delete "$basedir/nqp";
directory-delete "$basedir/MoarVM";

git-scm "https://github.com/rakudo/rakudo.git", %(
  to => "$basedir/selfrepo"
);

bash q:to /HERE/, %( description => "checkout-repos-for-test.pl", cwd => "{$*CWD}/$basedir" );
  perl selfrepo/tools/build/checkout-repos-for-test.pl \
  rev-9072438-selfrepo downstream downstream
HERE

bash q:to /HERE/, %( description => "build moar", cwd => "{$*CWD}/$basedir/MoarVM" );
  set -x
  export MAKEFLAGS=-j6 && \
  perl Configure.pl --prefix=../install && make -j6 install
HERE

bash q:to /HERE/, %( description => "build nqp", cwd => "{$*CWD}/$basedir/nqp");
  set -x
  perl Configure.pl  --prefix=../install --backends=moar && make -j6 install
HERE

bash q:to /HERE/, %( description => "install rakudo", cwd => "{$*CWD}/$basedir/rakudo" );
  set -x
  perl Configure.pl --prefix=../install && make -j6 install
HERE