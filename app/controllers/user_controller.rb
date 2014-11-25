class UserController < ApplicationController
  def profile
    @category = Category.all
  end

  def create

  end
end
