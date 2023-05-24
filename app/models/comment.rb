class Comment < ApplicationRecord
  has_many :likes, as: :likable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :nullify

  belongs_to :commentable, polymorphic: true, counter_cache: true
  belongs_to :user
end
