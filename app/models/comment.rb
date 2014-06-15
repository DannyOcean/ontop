class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :duel

  def update_after_save(current_user)
    self.update_attributes(user_id: current_user.id)
  end  
end
