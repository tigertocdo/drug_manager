class ApplicationController < ActionController::Base
  protected
  def after_sign_in_path_for(resource)
    if current_user.admin?
      stored_location_for(resource) || admins_path
    else
      stored_location_for(resource) || root_path
    end
  end
end
