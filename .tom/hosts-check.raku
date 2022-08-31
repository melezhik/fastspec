for config()<hosts><> -> $h {
  
  task-run "check [$h]", "curl", %(
    args => [
      %( 
        dump-header => '-',
        output => '/dev/null',
        connect-timeout => 10,
      ),
      [
        'silent',
        'location'
      ],
      "http://{$h}:4000"
    ]
);

}
