class CreatePosts < ActiveRecord::Migration
  def change
    create_table :post |t|
      t.string :title
      t.string :content
      t.integer :author_id

      t.timestamps(null: false)
    end
  end
end
