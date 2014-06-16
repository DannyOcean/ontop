class Duel < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :comments
  has_many :votes
  
  def update_after_save(current_user)
    self.update_attributes(caller_id: current_user.id)
    self.users << User.find(self.caller_id, self.accepter_id)
  end
end
