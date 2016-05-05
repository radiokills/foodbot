class Pauza < Restaurant

  def initialize
    @page_url = 'http://www.pauza.si/52-dnevne-malice'
    @name = "Pauza"
  end

  def menu
    page_body.xpath("//*[@id='system']/article/div/table/tbody/tr")
      .map{|element| element.text.gsub(/\n|\r|\t/,' ').squeeze(' ').strip}
      .reject(&:empty?)
      .drop(1)
      .map {|txt| {text: txt}}
  end

end
