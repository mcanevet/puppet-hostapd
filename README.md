Hostapd
=======

[![Build Status](https://travis-ci.org/mcanevet/puppet-hostapd.png?branch=master)](https://travis-ci.org/mcanevet/puppet-hostapd)

Overview
--------

The hostapd module allows you to easily manage hostapd with puppet.

Usage
-----

Just include the `hostapd` class

```puppet
class { '::hostapd':
  ssid => 'foo',
}
```

For a more customized configuration:

```puppet
class { '::hostapd':
  ssid      => 'foo',
  interface => 'wlan0',
  bridge    => 'br0',
}
```

Declare an additional bssid:

```puppet
hostapd::bssid { 'wlan0_0':
  ssid      => 'bar',
  bridge    => 'br0',
}
```

Reference
---------

Classes:

* [hostapd](#class-hostapd)
* [hostapd::config](#class-hostapd)
* [hostapd::install](#class-hostapd)
* [hostapd::service](#class-hostapd)

Resources:

* [hostapd::bssid](#resource-hostapdbssid)

###Class: hostapd
This class is used to install, configure and manage hostapd daemon.

####`ssid`

####`interface`

####`bridge`

####`driver`

####`hw_mode`

####`channel`

####`wmm_enabled`

####`ieee80211n`

####`ht_capab`

####`auth_algs`

####`wpa`

####`wpa_passphrase`

####`wpa_key_mgmt`

####`wpa_pairwise`

####`rsn_pairwise`

####`version`
The version of hostapd to install/manage. Defaults to your operating system default.

####`enable`
Should the service be enabled during boot time ?

####`start`
Should the service be started by Puppet ?

####`bssids`
Hash of additional bssids to configure.

###Class: hostapd::config
Configure hostapd.
You should not declare this class explicitely, it should be done by the `hostapd` class.

###Class: hostapd::install
Install hostapd.
You should not declare this class explicitely, it should be done by the `hostapd` class.

###Class: hostapd::service
Manage hostapd service.
You should not declare this class explicitely, it should be done by the `hostapd` class.

###Resource: hostapd::bssid

####`namevar`
The name of the bssid to declare.

####`bss`
The name of the bssid, defaults to namevar.

####`ssid`

####`bssid`

####`interface`

####`bridge`

####`driver`

####`hw_mode`

####`channel`

####`wmm_enabled`

####`ieee80211n`

####`ht_capab`

####`auth_algs`

####`wpa`

####`wpa_passphrase`

####`wpa_key_mgmt`

####`wpa_pairwise`

####`rsn_pairwise`
