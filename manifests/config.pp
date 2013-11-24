class hostapd::config {

  concat_build { 'hostapd.conf': }
  ->
  file { '/etc/hostapd/hostapd.conf':
    owner  => root,
    group  => root,
    mode   => '0600',
    source => concat_output('hostapd.conf')
  }

  concat_fragment { 'hostapd.conf+01':
    content => template('hostapd/hostapd.conf.erb'),
  }

  validate_hash($::hostapd::bssids)
  create_resources(hostapd::bssid, $::hostapd::bssids)

  shellvar { 'DAEMON_CONF':
    ensure => present,
    target => '/etc/default/hostapd',
    value  => '/etc/hostapd/hostapd.conf',
  }
}
