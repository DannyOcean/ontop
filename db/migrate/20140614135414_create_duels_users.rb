class CreateDuelsUsers < ActiveRecord::Migration
  def change
    create_table :duels_users, id: false  do |t|
      t.integer :duel_id
      t.integer :user_id
    end
  end
end
