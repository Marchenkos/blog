class Review < ApplicationRecord
  has_one_attached :cover
  belongs_to :writer, class_name: 'User'
end
