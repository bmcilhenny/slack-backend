class AddTeamIdToChannels < ActiveRecord::Migration[5.1]
  def change
    add_column :channels, :team_id, :integer
  end
end
