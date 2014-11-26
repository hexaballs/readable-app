require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'watir-webdriver'

url = "http://grantland.com/hollywood-prospectus/"
# b = Watir::Browser.new :chrome
# # Opens link in browser
# b.goto url
# # scroll down page so that javascript will load
# 150.times do b.send_keys :space end
# # allow some time for page to load
# sleep 50

# nokogiri starts here
# doc = Nokogiri::HTML.parse(b.html)

doc = Nokogiri::HTML(open(url))

all_links = doc.css('.media a')
puts all_links





