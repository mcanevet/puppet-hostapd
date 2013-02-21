# == Class: hostapd
#
# Full description of class hostapd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { hostapd:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2011 Your name here, unless otherwise noted.
#
class hostapd (
  $ssid,
  $interface = unset,
  $bridge = unset,
  $driver = unset,
  $hw_mode = unset,
  $channel = unset,
  $wmm_enabled = unset,
  $ieee80211n = unset,
  $ht_capab = unset,
  $auth_algs = unset,
  $wpa = unset,
  $wpa_passphrase = unset,
  $wpa_key_mgmt = unset,
  $wpa_pairwise = unset,
  $rsn_pairwise = unset,
) {
  class{'hostapd::install':} ~>
  class{'hostapd::config':} ~>
  class{'hostapd::service':} ~>
  Class['hostapd']
}
