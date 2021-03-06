class Article < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :images
  validates :title, uniqueness: { case_sensitive: false }
end
