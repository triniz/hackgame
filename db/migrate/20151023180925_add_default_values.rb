class AddDefaultValues < ActiveRecord::Migration
  def change
      change_column :players, :avatar, :string, default: 'N04'
      change_column :players, :no_flag, :integer, default: '0'
      change_column :players, :points, :integer, default: '0'
  end
end
