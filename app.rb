require 'rubygems'
require 'bundler'

Bundler.require

require_relative 'restaurant'
require_relative 'foodbot'

Dir["restaurants/*.rb"].each {|file| require_relative file }

restaurants = Restaurant.descendants.map(&:new).map {|r| [r.command_name, r] }.to_h
foodbot = Foodbot.new(restaurants)

post "/" do
  command = params[:text].downcase
  foodbot.respond_to(command)
end
