#!/usr/bin/ruby

attempts = 0
while (devices = `iwconfig 2> /dev/null`.split("\n").collect{|line| line =~ /^(\w+)/ && $1}.compact).empty? && attempts < 60  
  attempts += 1
  puts "NO wireless devices found (#{attempts})..."
  sleep 1
end

devices.each{|device| `ifdown #{device}`}
devices.each{|device| `ifup #{device}`}
