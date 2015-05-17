require 'date'
require 'httparty'
require 'nokogiri'
require 'active_support/core_ext/string/multibyte'
require 'active_support/multibyte/chars'

class Restaurant

  def menu_text
    raise "No restaurant name specified" unless @name
    menu_text = menu.map {|item| menu_item_text(item) }.join("\n")

    "*#{title_text}*\n#{menu_text}"
  end

  def command_name
    self.class.name.downcase
  end

  def latest_workday
    # by default, restaurants work monday (1) to friday (5)
    [Date.today.wday, 5].min
  end

  def latest_workdate
    (Date.today - Date.today.wday) + latest_workday
  end

  def self.descendants
    ObjectSpace.each_object(Class).select {|klass| klass < self }
  end

protected

  def page_body
    raise "No url specified" unless @page_url
    response = HTTParty.get(@page_url)
    Nokogiri::HTML(response.body)
  end

  def title_text
    date = latest_workdate.strftime("%A, %d. %m. %Y")

    "#{@name} (#{date})"
  end

  def menu_item_text(item)
    text = normalize_menu_item(item[:text])
    price = item[:price]

    "  • #{text}" + (price ? " (#{price})" : "")
  end

  def normalize_menu_item(text)
    text
      .strip
      .gsub(',', ', ').gsub(/\s+/, ' ') # fix poorly placed commas
      .mb_chars.downcase.to_s # downcase everything for consistency
  end

end
