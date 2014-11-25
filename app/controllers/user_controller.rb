class UserController < ApplicationController
  def profile
    @category = Category.all
  end

  def user_category
    @user_category = current_user.categories.order("category_name ASC")
  end

  def user_all_category
    all_category = Category.all
    user_category = current_user.categories

    @user_all_category = all_category.order("category_name ASC") - user_category
  end

  def submit
    current_user.categories.destroy_all
    params[:data].each do |data|
      c = Category.where(id: data[:id])
      current_user.categories << c
    end
    render nothing: true
  end

  def articles
    user_articles = []
    user_category = current_user.categories
    user_category.each do |c|
      c.articles.each do |a|
        user_articles.push(a)
      end
    end
    @user_articles = user_articles.uniq
  end

end
