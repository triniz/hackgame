class AddTimerToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :timer, :integer, default: '90'
  end
end
