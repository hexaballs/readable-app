class CreateArticlesCategoriesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :articles_categories, id: false do |t|
      t.integer :article_id
      t.integer :category_id
    end

    add_index :articles_categories, [:article_id, :category_id]
  end

  def self.down
    drop_table :articles_categories
  end
end
