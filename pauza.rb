class Pauza < Base

  def initialize
    @page_url = 'http://www.pauza.si/52-dnevne-malice'
    @restaurant_name = "Pauza"
  end

  def menu
    to_eat = page_body.xpath("//*[@id='system']/article/div/table").text.gsub("\t","").gsub("\r","").gsub("\n\n","\n").split("\n").reject{|k| k=="" || k=="6,50 €"}.take(8)
    to_eat.join("\n")
  end

end
