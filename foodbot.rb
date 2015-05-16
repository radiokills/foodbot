require 'httparty'
require 'parallel'
require_relative 'bon_apetit'

class Foodbot

  SLACK_HOOK_URL = ENV['SLACK_HOOK_URL']

  def initialize(restaurants)
    @restaurants = restaurants
    @commands = restaurants.keys + ["all"]
  end

  def respond_to(command)
    if command == "all"
      Parallel.map(@restaurants.values) {|res| res.menu_text }
              .push("\n_#{BonApetit.random}_").join("\n")
              .tap {|text| post_to_slack(text)}
    elsif @restaurants[command]
      post_to_slack(@restaurants[command].menu_text + "\n\n_#{BonApetit.random}_")
    elsif command.empty?
      post_to_slack("You can use foodbot with the following params: #{@commands.join(', ')}")
    else
      post_to_slack("Command #{command} is not implemented")
    end
  end

private

  def post_to_slack(text)
    payload = {text: text}.to_json
    HTTParty.post(SLACK_HOOK_URL, body: payload, headers: { 'Content-Type' => 'application/json' })
  end

end
