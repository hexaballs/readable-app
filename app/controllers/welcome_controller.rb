class WelcomeController < ApplicationController
  def index
    @article = Article.all.shuffle
    @category = Category.all
  end
end
