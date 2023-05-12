class Review < ApplicationRecord
  has_one_attached :cover
  belongs_to :user
  has_many :likes, dependent: :destroy

  acts_as_punchable

  def liked?(user:)
    likes.any? { |like| like.user_id == user.id }
  end
end
