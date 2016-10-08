require 'rubygems'
require_relative 'utils'
require 'zlib'
require 'base64'

@util =  Utils.new "dump1.dump"

s = IO.read(@util.get_dump_name)

pastes = s.split "|D|"



open(@util.get_dump_name + ".dec", 'w+') { |f|
  pastes.each do |paste|
    f.puts Zlib::Inflate.inflate Base64.decode64 paste

  end
}
