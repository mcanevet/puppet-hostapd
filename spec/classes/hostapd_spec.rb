require 'spec_helper'

describe 'hostapd' do

  context 'when no parameter passed' do
    let(:params) { { } }

    it 'should fail' do
      expect { should create_class('hostapd') }.to raise_error(Puppet::Error, /Must pass ssid to Class\[Hostapd\]/)
    end
  end

  context 'when ssid passed' do
    let(:params) { {
      :ssid => 'foo',
    } }

    it { should create_class('hostapd').with({
      :ssid           => 'foo',
      :interface      => nil,
      :bridge         => nil,
      :driver         => nil,
      :hw_mode        => nil,
      :channel        => nil,
      :wmm_enabled    => nil,
      :ieee80211n     => nil,
      :ht_capab       => nil,
      :auth_algs      => nil,
      :wpa            => nil,
      :wpa_passphrase => nil,
      :wpa_key_mgmt   => nil,
      :wpa_pairwise   => nil,
      :rsn_pairwise   => nil,
      :version        => :present,
      :enable         => true,
      :start          => true,
      :bssids         => {},
    })}
    it { should contain_class('hostapd::install') }
    it { should contain_class('hostapd::config') }
    it { should contain_class('hostapd::service') }

  end

  context 'when bssids is not a hash' do
    let(:params) { {
      :ssid   => 'foo',
      :bssids => 'bar',
    } }

    it 'should fail' do
      expect { should create_class('hostapd') }.to raise_error(Puppet::Error,/ is not a Hash/)
    end
  end

end
