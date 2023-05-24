class Review < ApplicationRecord
  has_one_attached :cover
  belongs_to :user
  has_many :likes, as: :likable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :visits, class_name: 'ReviewVisit', inverse_of: :review, dependent: :destroy

  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false
  validates :author, presence: true, allow_blank: false
  validates :book_name, presence: true, allow_blank: false

  def liked?(user:)
    likes.any? { |like| like.user_id == user.id }
  end
end
