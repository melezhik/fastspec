#!raku

my $msg = prompt("message: ");

task-run "commit my changes", "git-commit", %( message => $msg );

