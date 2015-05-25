class Favola < Restaurant

  def initialize
    @page_url = 'http://www.favola.si/FAVOLA,,ponudba/kosila'
    @name = "Favola"
  end

  def menu
    tmp = page_body.xpath("//*[@id='kosilaShow']/div")
	.map{|div| div.text()}[Date.today.wday - 1]
	.split(/\*\*\*/)
	.map {|text| {text: text} }
  end

end
