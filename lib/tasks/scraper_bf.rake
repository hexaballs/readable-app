desc "Buzzfeed longform articles scraper"
task :fetch_bf => :environment do
  require 'nokogiri'
  require 'open-uri'
  require 'watir-webdriver'

  # Buzzfeed longform articles
  url = "http://www.buzzfeed.com/bigstories"
  doc = Nokogiri::HTML(open(url))

  # grab all the links to articles shown in this page
  all_links = doc.css('div.span-12')

  # for each link, use watir to load the pass, and scrape the required data
  all_links.each do |link|
    if not link.text.include? "Our 9 Favorite"
      url = "http://www.buzzfeed.com#{link['href']}"

      b = Watir::Browser.new :chrome
      b.goto url
      sleep 15

      doc = Nokogiri::HTML.parse(b.html)

      title = doc.at_css('h1#post-title').text
      pub_date = doc.at_css('.buzz_datetime').text[/[A-Za-z]{3}\W\s\d{1,}\W\s\d{4}/].gsub(/\W{2}/, " ")
      author = doc.at_css('.user-info-info a').text.gsub(/\n+\s+/, "")
      content = doc.at_css('.c.suplist_long.suplist_list_show.suplist_long_custom_header').to_s
      main_img_url = doc.at_css('img.bf_dom')['src']
      link_identifier = url

      Article.create(:title => title, :author => author, :pub_date => pub_date, :content => content, :main_img_url => main_img_url, :link_identifier => link_identifier)
      b.close
    end
  end

end