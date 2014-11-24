class CreateCategoriesUsersJoinTable < ActiveRecord::Migration
  def self.up
    create_table :categories_users, id: false do |t|
      t.integer :category_id
      t.integer :user_id
    end

    add_index :categories_users, [:category_id, :user_id]
  end

  def self.down
    drop_table :categories_users
  end
end
