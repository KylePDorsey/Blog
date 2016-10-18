class CreateComments < ActiveRecord::Migration
  def change
    create_table :comment |t|
      t.string :content
      t.integer :post_id

      t.timestamps(null: false)
    end
  end
end
