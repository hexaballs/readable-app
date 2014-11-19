require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'watir-webdriver'


url = "http://mashable.com/category/must-reads/"
doc = Nokogiri::HTML(open(url))

all_links = doc.css(".article-title a")[0,5]

all_links.each do |link|
  url = link['href']
  puts url

  doc = Nokogiri::HTML(open(url))

  title = doc.at_css(".article-header h1.title").text
  puts title

  pub_date = url.gsub(/\d{4}\W\d{2}\W\d{2}/).first
  puts pub_date

  unless doc.at_css(".author_name").nil?
    author = doc.at_css(".author_name").text.gsub(/By\s/, "")
    puts author
  end



end