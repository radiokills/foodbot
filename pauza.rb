class Pauza < Base

  def initialize
    @page_url = 'http://www.pauza.si/52-dnevne-malice'
    @restaurant_name = "Pauza"
  end

  def menu
    page_body.xpath("//*[@id='system']/article/div/table").text
      .split(/\s{2,}/)
      .map(&:strip).reject(&:empty?)
      .drop(1)
      .each_slice(2)
      .select {|pair| pair[1] && pair[1].include?("€")}
      .map {|pair| pair.join(" - ")}
      .join("\n")
  end

end
