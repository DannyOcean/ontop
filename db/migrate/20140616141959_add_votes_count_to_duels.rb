class AddVotesCountToDuels < ActiveRecord::Migration
  def change
    add_column :duels, :caller_votes, :integer
    add_column :duels, :accepter_votes, :integer
  end
end
