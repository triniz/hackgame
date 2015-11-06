class CreatePlayerFlags < ActiveRecord::Migration
  def change
    create_table :player_flags do |t|
      t.belongs_to :player, index: true 
      t.belongs_to :flag, index: true

      t.timestamps null: false
    end
  end
end
