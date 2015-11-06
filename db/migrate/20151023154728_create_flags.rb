class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.string :value
      t.integer :weight

      t.timestamps null: false
    end
  end
end
