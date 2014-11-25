json.array!(@user_articles) do |article|
  json.extract! article, :id, :title, :author, :pub_date, :link_identifier, :main_img_url, :content, :categories
  json.url article_url(article, format: :json)
end
