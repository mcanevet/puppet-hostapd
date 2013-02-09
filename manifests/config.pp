class hostapd::config {

  file { '/etc/hostapd/hostapd.conf':
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('hostapd/hostapd.conf.erb'),
  }

}
