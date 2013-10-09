group { "puppet":
   ensure => "present",
}
user { "build":
  ensure => present, 
  groups => "mock",
  require => Package['mock'],
}
package { "mock":
  ensure => latest,
}
package { "rpmdevtools":
  ensure => latest,
}
package { "rpm-build":
  ensure => latest,
}
package { "rng-tools":
  ensure => latest,
}

#file { "/home/build/.rpmmacros":
#  owner => build,
#  group => mock,
#  mode => 644,
#  content => "<basic`> %packager       Rudy Grigar
#<basic`> %_signature     gpg
#<basic`> %_gpg_name      Rudy Grigar
#<basic`> %_topdir        /home/basic/rpmbuild
#<basic`> #Payload compression with gzip:
#<basic`> %_source_payload       w9.gzdio
#<basic`> %_binary_payload       w9.gzdio
#<basic`> #Use md5 for file hash algorithm:
#<basic`> %_source_filedigest_algorithm  1
#<basic`> %_binary_filedigest_algorithm  1 ",
#}

File { owner => 0, group => 0, mode => 0644 }
  file { '/etc/motd':
    content => "Welcome to your Vagrant-built virtual machine!
                Managed by Puppet.\n"
  }
