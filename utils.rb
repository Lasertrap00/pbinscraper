require 'colorize'
require 'zlib'
require 'base64'
require 'open-uri'

class Utils

  @dump_name = "Dump1.dump"
  @filter = Array.new

  def get_dump_name
     @dump_name
  end

  def initialize name_of_dump
    @dump_name = name_of_dump

    File.open('words.txt').each do |line|
      @filter.push line.downcase
    end
  end

  def should_dump paste
    @filter.any? { |word| paste.downcase.include?(word) }
  end

  def time_as_string
    t = Time.now
    t.strftime('%H:%M:%S')
  end

  def u_puts tolog
    puts "[#{time_as_string}] ".green + "#{tolog}".yellow
  end

  def get_from_user to_ask
    print "[#{time_as_string}] ".green + "#{to_ask}: ".red
    gets.chomp
  end

  def to_url code
    "http://pastebin.com/#{code}"
  end

  def dump to_dump
    compressed = Base64.encode64 Zlib::Deflate.deflate to_dump

    File.open(@dump_name, 'a+') {|file|
      file.write compressed + '|D|'
    }
  end

  def get_raw_content code
    "\n" + '------------------------------------ '+ to_url(code) +' -----------------------------------------------' + "\n\n" + open(URI("http://pastebin.com/raw/#{code}")).read
  end
end