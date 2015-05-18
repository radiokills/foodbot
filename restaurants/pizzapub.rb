class Pizzapub < Restaurant

  def initialize
    @page_url = 'http://www.pizzapub.si'
    @name = "Pizza Pub"
  end

  def menu
    page_body.css(".liquid-slider > div")[latest_workday].css('h6')
      .map(&:text).map(&:strip)
      .reject {|text| text.empty? || text.downcase.include?("ponudba") }
      .map {|text| {text: text} }
  end

end
