class Review < ApplicationRecord
  has_one_attached :cover
  belongs_to :user
  has_many :likes, dependent: :destroy

  acts_as_punchable

  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false
  validates :author, presence: true, allow_blank: false
  validates :book_name, presence: true, allow_blank: false

  def liked?(user:)
    likes.any? { |like| like.user_id == user.id }
  end
end
