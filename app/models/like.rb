class Like < ApplicationRecord
  belongs_to :review, counter_cache: true
  belongs_to :user
end
