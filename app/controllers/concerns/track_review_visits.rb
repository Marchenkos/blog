module TrackReviewVisits
  extend ActiveSupport::Concern

  included do
    helper_method :track_visit
  end

  def track_visit
    return if params[:id].blank?

    begin
      review = Review.find(params[:id])
      ReviewVisit.create(user: current_user, review:)
    rescue => e
      pp "Failed to track review visit - #{e.message}"
    end
  end
end
