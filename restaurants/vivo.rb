class Vivo < Restaurant

  def initialize
    @page_url = 'http://www.vivo.si/tedenski-menu-v-restavraciji-d125/'
    @name = "Vivo"
  end

  def menu
    menu = page_body.css(".mainstayli")[latest_workday].text.split(/\r\n/)
    menu.pop
    menu.map {|text| {text: text} }
  end

end
