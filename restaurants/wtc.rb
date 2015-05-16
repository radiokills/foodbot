class Wtc < Restaurant

  def initialize
    @page_url = 'http://www.femec.si/poslovne-enote/'
    @name = "WTC Menza"
  end

  def menu
    dayname = slovenian_weekday(latest_workday)
    page_body.at_css("##{dayname}").css("div.menucontent").map do |menu|
      {text: menu.css('p').take(2).map(&:text).join(", ")}
    end
  end

private

  def slovenian_weekday(weekday)
    %w(ponedeljek torek sreda cetrtek petek)[weekday - 1]
  end

end
