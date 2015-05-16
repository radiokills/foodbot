class Pauza < Restaurant

  def initialize
    @page_url = 'http://www.pauza.si/52-dnevne-malice'
    @name = "Pauza"
  end

  def menu
    page_body.xpath("//*[@id='system']/article/div/table").text
      .split(/\s{2,}/)
      .map(&:strip).reject(&:empty?)
      .drop(1)
      .each_slice(2)
      .select {|pair| pair[1] && pair[1].include?("€")}
      .map {|pair| {text: pair[0], price: pair[1]}}
  end

end
