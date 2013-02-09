class hostapd::service {

  service{'hostapd':
    ensure => running,
    enable => true,
  }

}
