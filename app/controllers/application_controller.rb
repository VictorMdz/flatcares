class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pundit

  private

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :type])
    devise_parameter_sanitizer.for(:invite) << :flat_id
    # For additional in app/views/devise/registrations/edit.html.erb
    # devise_parameter_sanitizer.permit(:account_update, keys: [:picture])
  end
  
  def after_sign_in_path_for(resource)
    if resource.flats.count > 0
      flat_path(resource.flats[0])
    else
      flats_path
    end
  end

end
