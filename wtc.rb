class Wtc < Base

  def initialize
    @page_url = 'http://www.femec.si/poslovne-enote/'
    @restaurant_name = "WTC Menza"
  end

  def menu
    weekday = Date.today.wday
    dayname = slovenian_weekday(weekday)
    page_body.at_css("##{dayname}").css("div.menucontent").map{|menu, i| menu.text}.join("\n**\n")
  end

end
