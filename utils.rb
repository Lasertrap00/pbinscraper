require 'colorize'
require 'zlib'
require 'base64'
require 'open-uri'
class Utils

  @dumpname = "Dump1.dump"

  def get_dump_name
    return @dumpname
  end

  def initialize nameOfDump
    @dumpname = nameOfDump
  end

  def timeAsString
    t = Time.now
    return t.strftime("%H:%M:%S")
  end

  def u_puts tolog
    puts "[#{timeAsString}] ".green + "#{tolog}".yellow
  end

  def getFromUser toDisplay
    print "[#{timeAsString}] ".green + "#{toDisplay}: ".red
    return gets.chomp
  end

  def to_url code
    return "http://pastebin.com/#{code}"
  end

  def dump toDump
    compressed = Base64.encode64 Zlib::Deflate.deflate toDump
    File.open(@dumpname, 'a+') {|file|
      file.write compressed + "|D|"
    }
  end

  def getRawContent code
    return  "\n" +  "------------------------------------ "+ to_url(code) +" -----------------------------------------------" + "\n\n" + URI.parse("http://pastebin.com/raw/#{code}").read
  end

end