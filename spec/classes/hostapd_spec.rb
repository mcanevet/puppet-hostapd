require 'spec_helper'

describe 'hostapd' do

  context 'when no parameter passed' do
    let(:params) { { } }

    it 'should fail' do
      expect { should create_class('hostapd') }.to raise_error(Puppet::Error, /Must pass ssid to Class\[Hostapd\]/)
    end
  end

end
