require 'colorize'

class Utils

  def Log(toLog)
      t = Time.now
      time = t.strftime("%H:%M:%S")
      puts "[#{time}] ".green + "#{toLog}\n".yellow
  end
end