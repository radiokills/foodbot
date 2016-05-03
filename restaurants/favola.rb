class Favola < Restaurant

  def initialize
    @page_url = 'http://www.favola.si/FAVOLA,,ponudba/kosila'
    @name = "Favola"
  end

  def menu
    page_body.xpath("//*[@id='kosilaShow']/div[#{Date.today.wday}]")
      .first.text
      .split(/\*\*\*/)
      .map {|text| {text: text} }
  end

end
