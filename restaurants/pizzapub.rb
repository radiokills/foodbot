class Pizzapub < Restaurant

  def initialize
    @page_url = 'http://www.pizzapub.si'
    @name = "Pizza Pub"
  end

  def menu
    slider = page_body.at_css(".liquid-slider")
    menu_today = slider.children[latest_workday + (latest_workday - 1 )].css('h6')
    menu_today.map(&:text).map(&:strip).reject(&:empty?).map {|text| {text: text} }
  end

  def latest_workday
    # monday (1) to saturday (6-
    [Date.today.wday, 6].min
  end

end
