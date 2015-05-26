class Glazuta < Restaurant

  def initialize
    @page_url = 'http://www.glazuta.com/dnevna-ponudba/'
    @name = "Glažuta"
  end

  def menu
    page_body.xpath('//*[@class="entry-content"]/p')
      .text()
      .split(/\n/)
      .map{|item| item[/KOSILO.*?:\t(.*)/,1]}
      .compact
      .map {|text| {text: text}}
  end

end
