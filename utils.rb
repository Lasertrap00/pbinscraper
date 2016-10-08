require 'colorize'
require 'zlib'
require 'base64'
require 'open-uri'
require 'win32/registry'

class Utils

  @filter = Array.new

  def initialize
    File.open('words.txt').each do |line|
      @filter.push line.downcase
    end
  end

  def get_registry_value(hive, key_path, key_name)
    reg_obj=hive.open(key_path, Win32::Registry::KEY_READ)
    begin
      reg_typ, reg_val = reg_obj.read(key_name)
    rescue Win32::Registry::Error
      u_puts "Error"
    end
    reg_val
  end

  def set_registry_value(hive, key_path, key_name, key_value)
    begin
      reg_key=hive.open(key_path, Win32::Registry::KEY_WRITE)
      u_puts "opened key"
      reg_key.write(key_name, Win32::Registry::REG_SZ, key_value)
    rescue Win32::Registry::Error
      u_puts "setKeyStringValue error:"
      return false
    end
    true
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
  end

  def get_raw_content code
    "\n" + '------------------------------------ '+ to_url(code) +' -----------------------------------------------' + "\n\n" + open(URI("http://pastebin.com/raw/#{code}")).read
  end
end