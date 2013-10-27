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

  $newmac = macaddress_for_multiple_bssid($::hostapd::interface)

  augeas { 'interfaces':
    incl    => '/etc/network/interfaces',
    lens    => 'Interfaces.lns',
    changes => [
      "set iface[. = '${hostapd::interface}'][family = 'inet']/hostapd /etc/hostapd/hostapd.conf",
      "set iface[. = '${hostapd::interface}'][family = 'inet']/pre-up 'ifconfig ${hostapd::interface} hw ether ${newmac}'",
    ],
  }

  validate_hash($::hostapd::bssids)
  create_resources(hostapd::bssid, $::hostapd::bssids)

}
