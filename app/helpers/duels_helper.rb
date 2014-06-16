module DuelsHelper
  def voted?(user, duel)
    Vote.where(user_id: user.id, duel_id: duel.id).present?
  end
end
