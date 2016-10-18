class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes |t|
      t.integer :vote_id
      t.integer :vote_id
      t.string :voteable_type

      t.timestamps(null: false)
    end
  end
end
