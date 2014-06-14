class CreateDuels < ActiveRecord::Migration
  def change
    create_table :duels do |t|
      t.string   :title
      t.integer  :caller_id
      t.integer  :accepter_id
      t.integer  :winner_id
      t.integer  :looser_id
      t.datetime :deadline
      t.boolean  :accepted
      t.timestamps
    end
  end
end
