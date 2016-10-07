require 'rubygems'
require_relative 'utils'

require 'open-uri'
require 'nokogiri'

@util =  Utils.new

@util.u_puts "Starting Pastebin Scraper by Sapphyrus and Lasertrap..."

pastes = Array.new

page = Nokogiri::HTML(open('http://pastebin.com/archive'))

array = page.css('table')[0].to_s.split('				<td>')

array.each do | split |
  v = split.split('<a href=\"').to_s[61..68]
  if v != "h scope="
    pastes.push(v)
  end
end

puts pastes.to_s