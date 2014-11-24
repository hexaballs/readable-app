class WelcomeController < ApplicationController
  def index
    @article = Article.all.shuffle
  end

  def profile
    @category = Category.all
  end
end
