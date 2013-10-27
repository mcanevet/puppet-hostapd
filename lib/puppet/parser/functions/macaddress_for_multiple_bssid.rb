Puppet::Parser::Functions.newfunction(:macaddress_for_multiple_bssid, :type => :rvalue) do | args|
  fact = "macaddress_#{args[0]}"
  ("0x#{Facter[fact].value.split(':').join()}".hex & 0xfffffffffff0 | 0x020000000000).to_s(16).rjust(12, '0').scan(/.{2}/).join(':')
  
end
