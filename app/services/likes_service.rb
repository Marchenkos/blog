class LikesService
  def self.toggle_like(user:, likable:)
    return if likable.blank?

    if Like.where(user:, likable:).exists?
      remove_like(user:, likable:)
    else
      create_like(user:, likable:)
    end
  end

  def self.create_like(user:, likable:)
    return if likable.blank?

    new_like = Like.new(user:, likable:)
    new_like.save
  end

  def self.remove_like(user:, likable:)
    return if likable.blank?

    Like.find_by(user:, likable:).destroy
  end
end
