class WelcomeController < ApplicationController
  def index
    @article = Article.all.shuffle
  end
end
