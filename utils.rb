require 'colorize'
require 'zlib'
require 'base64'

class Utils

  @dumpname = "Dump1.dump"

  def initialize nameOfDump
    @dumpname = nameOfDump
  end

  def timeAsString
    t = Time.now
    return t.strftime("%H:%M:%S")
  end

  def log tolog
    puts "[#{timeAsString}] ".green + "#{tolog}".yellow
  end

  def getFromUser toDisplay
    print "[#{timeAsString}] ".green + "#{toDisplay}: ".red
    return gets.chomp
  end

  def dump toDump
    compressed = Base64.encode64 Zlib::Deflate.deflate toDump
    File.open(@dumpname, 'a+') {|file|
      file.write compressed + "|D|"
    }
  end

  def getRawUrl code
    return "http://pastebin.com/raw/#{code}"
  end

end