class CreateUserChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :user_channels do |t|
      t.datetime :last_seen
      t.string :status, :default => "pending"
      t.integer :user_id
      t.integer :channel_id
      t.timestamps
    end
  end
end
