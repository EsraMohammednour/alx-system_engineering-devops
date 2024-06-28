#Create a filein /tmp.
file { '/tmp/school':
  mode => '0744',
  owner => 'www-data',
  group => 'www-data',
  contain => 'I love Puppet',
}
