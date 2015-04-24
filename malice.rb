require 'rubygems'
require 'bundler'

Bundler.require

get '/pauza' do
  response = HTTParty.get('http://www.pauza.si/52-dnevne-malice')
  n = Nokogiri::HTML(response.body)
  n.xpath("//*[@id='system']/article/div/table").text.gsub("\t","").gsub("\r","").gsub("\n\n","\n").split("\n").reject{|k| k=="" || k=="6,50 €"}.take(8).to_json
end
