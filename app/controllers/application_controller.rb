class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :page_for_js
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # jquery.turbolinksが全てのページで発火しないように、発火させるページにはgon.pageの値を変える。jsでgon.pageを使って分岐させる。
  def page_for_js
    gon.page = nil
  end
end
