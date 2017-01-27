class ActivitiesController < ActionController::Base
  before_action doorkeeper_authorize!

  def index
    @activities = PublicActivity::Activity
                  .order(created_at: :desc)
                  .where(owner_id: current_user.events.uses, owner_type: 'User')
                  .where.not(owner_id: current_user.id)

    render json: @activities
  end

  private

  def events_users_ids
    current_user
      .events
      .map(&:users)
      .map(&:ids)
      .flatten
      .uniq
  end
end
