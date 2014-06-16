class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :duel

  def update_after_save(user)
    self.update_attributes(user_id: user.id)
  end
end
