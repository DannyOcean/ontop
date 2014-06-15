class Duel < ActiveRecord::Base
  has_and_belongs_to_many :users

  def set_params(current_user)
    self.update_attributes(caller_id: current_user.id)
    self.users << User.find(self.caller_id, self.accepter_id)
  end
end
