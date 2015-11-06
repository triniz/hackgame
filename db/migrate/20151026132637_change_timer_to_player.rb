class ChangeTimerToPlayer < ActiveRecord::Migration
  def change
        change_column :players, :timer, :integer, default: '900'
  end
end
