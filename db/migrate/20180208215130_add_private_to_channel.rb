class AddPrivateToChannel < ActiveRecord::Migration[5.1]
  def change
    add_column :channels, :private, :boolean, :default => false
  end
end
