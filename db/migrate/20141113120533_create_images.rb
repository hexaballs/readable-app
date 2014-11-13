class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :sub_img_url

      t.timestamps
    end
  end
end
