class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :avatar
      t.string :password
      t.integer :no_flag
      t.integer :points
      t.timestamps null: false
    end
  end
end
