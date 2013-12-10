define hostapd::bssid(
  $ssid,
  $bss            = $name,
  $bssid          = undef,
  $interface      = undef,
  $bridge         = undef,
  $driver         = undef,
  $hw_mode        = undef,
  $channel        = undef,
  $wmm_enabled    = undef,
  $ieee80211n     = undef,
  $ht_capab       = undef,
  $auth_algs      = undef,
  $wpa            = undef,
  $wpa_passphrase = undef,
  $wpa_key_mgmt   = undef,
  $wpa_pairwise   = undef,
  $rsn_pairwise   = undef,
) {
  Class['hostapd::install'] ->
  Hostapd::Bssid[$title] ~>
  Class['hostapd::service']

  concat_fragment { "hostapd.conf+02_${bss}":
    content => template('hostapd/bssid.erb', 'hostapd/hostapd.conf.erb'),
  }
}
