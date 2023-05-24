class ReviewVisit < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :review, counter_cache: true
end
