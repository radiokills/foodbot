class Pizzapub < Restaurant

  def initialize
    @page_url = 'http://www.pizzapub.si'
    @name = "Pizza Pub"
  end

  def menu
    slider = page_body.at_css(".liquid-slider")
    menu_today = slider.children[latest_workday + (latest_workday - 1 )].css('h6')
    menu_today
      .map(&:text).map(&:strip)
      .reject {|text| text.empty? || text.downcase.include?("ponudba") }
      .map {|text| {text: text} }
  end

end
