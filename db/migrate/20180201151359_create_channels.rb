class CreateChannels < ActiveRecord::Migration[5.1]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :details
      t.integer :owner_id
      t.timestamps
    end
  end
end
