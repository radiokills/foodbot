class Pizzapub < Base

  def initialize
    @page_url = 'http://www.pizzapub.si'
    @restaurant_name = "Pizza Pub"
  end

  def menu
    weekday = Time.now.wday
    weekday = 5 if weekday > 5
    slider = page_body.at_css(".liquid-slider")
    menu = slider.children[weekday + (weekday - 1 )].children.text
  end

end
