class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.date :pub_date
      t.text :link_identifier
      t.text :main_img_url
      t.text :content

      t.timestamps
    end
  end
end
