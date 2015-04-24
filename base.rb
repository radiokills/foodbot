class Base

  SLACK_HOOK_URL = ENV['SLACK_HOOK_URL']

  def initialize
    @page_url = nil
    @restaurant_name = nil
  end

  def page_body
    raise "No url specified" unless @page_url
    response = HTTParty.get(@page_url)
    Nokogiri::HTML(response.body)
  end

  def menu_text
    raise "No restaurant name specified" unless @restaurant_name
    text  = "-----------------\n"
    text +=  @restaurant_name.upcase
    text +=  "\n-----------------\n"
    text += menu
    text += "\n\n"
    text
  end

  def post_menu_to_slack
    post_to_slack(menu_text)
  end

  def post_to_slack(text)
    payload = {text: text}.to_json
    HTTParty.post(SLACK_HOOK_URL, body: payload, headers:{ 'Content-Type' => 'application/json' })
  end

  def slovenian_weekday(weekday)
    weekday = 5 if weekday > 5
    %w(ponedeljek torek sreda cetrtek petek)[weekday - 1]
  end

end
