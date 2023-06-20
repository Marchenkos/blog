module TrackReviewVisits
  extend ActiveSupport::Concern

  included do
    helper_method :track_visit
  end

  def track_visit
    return if params[:id].blank?

    review = Review.find(params[:id])
    ReviewVisit.create(user: current_user, review:)
  end
end
