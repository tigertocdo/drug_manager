class AdminController <  ApplicationController
  before_action :check_access
  layout "layouts/admin"

  
  private
  def check_access
    if  user_signed_in? == false || current_user.admin == false
      redirect_to root_path
    end
  end
end
