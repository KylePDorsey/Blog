class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user |t|
      t.string :username
      t.string :password_hash

      t.timestams(null: false)
    end
  end
end
