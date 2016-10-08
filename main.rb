require 'rubygems'
require_relative 'utils'

require 'open-uri'
require 'nokogiri'

@util =  Utils.new "dump1.dump"

@util.u_puts "Starting Pastebin Scraper by Sapphyrus and Lasertrap..."

@util.dump @util.getRawContent("G0uJyEN4")
@util.dump @util.getRawContent("g2CR1qT9")
@util.dump @util.getRawContent("1pN1uyM8")
@util.dump @util.getRawContent("ZS6uDU6j")


scannedpastes = Array.new

while true

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
  pastes.each do | paste |
    @util.u_puts @util.getRawContent(paste)
  end
  sleep(60)
end