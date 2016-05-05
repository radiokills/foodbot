class Gastrohouse < Restaurant

  def initialize
    @page_url = 'http://www.gastrohouse.si/index.php/tedenska-ponudba'
    @name = "Gastro House"
  end

  def menu
    page_body.css(".futr ul")[Date.yesterday.wday].children.map{|element| element.inner_html.gsub("<span>", " ").gsub("</span>", "")}.reject(&:empty?).map{|text| {text: text} }
  end

end
