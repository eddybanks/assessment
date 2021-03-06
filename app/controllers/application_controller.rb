class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :set_paper_trail_whodunnit
  before_action :authenticate_user!
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def report_options
    return { ar: 'Assessment Reports', ap: 'Assessment Plans' }
  end

end
