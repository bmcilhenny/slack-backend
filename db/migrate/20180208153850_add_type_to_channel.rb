class AddTypeToChannel < ActiveRecord::Migration[5.1]
  def change
    add_column :channels, :channel_type, :string
  end
end
