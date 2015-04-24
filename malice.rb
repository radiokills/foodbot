require 'rubygems'
require 'bundler'

require_relative 'base'
require_relative 'malice_util'
require_relative 'pizzapub'
require_relative 'wtc'
require_relative 'pauza'
require_relative 'bon_apetit'

Bundler.require

post "/" do
  query = params[:text].downcase

  if query == "pizzapub"
    Pizzapub.new.post_menu_to_slack
  elsif query == "wtc"
    Wtc.new.post_menu_to_slack
  elsif query == "pauza"
    Pauza.new.post_menu_to_slack
  elsif query == "all"
    Pizzapub.new.post_menu_to_slack
    Wtc.new.post_menu_to_slack
    Pauza.new.post_menu_to_slack
  else
    MaliceUtil.new(query).respond
  end
  BonApetit.random
end
