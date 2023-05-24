class LikesService
  def self.toggle_like(likable:)
    return if likable.blank?

    if Like.where(user_id: current_user.id, likable:).exist?
      remove_like(likable:)
    else
      create_like(likable:)
    end
  end

  def self.create_like(likable:)
    return if likable.blank?

    new_like = Like.new(user_id: current_user.id, likable:)
    new_like.save
  end

  def self.remove_like(likable:)
    return if likable.blank?

    Like.find_by(user_id: current_user.id, likable:).destroy
  end
end
