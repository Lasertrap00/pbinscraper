require 'rubygems'
require_relative 'utils'

@util =  Utils.new

@util.log "Booting Pastebin Scraper by Sapphyrus and Lasertrap..."

username = @util.getFromUser "Enter Username"

@util.log "Welcome #{username}!"