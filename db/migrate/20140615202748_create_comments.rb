class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.integer :duel_id
      
      t.timestamps
    end
  end
end
