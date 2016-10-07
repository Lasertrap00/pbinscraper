require 'colorize'

class Utils

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

end