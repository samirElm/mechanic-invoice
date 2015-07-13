class ApplicationController < ActionController::Base
  # include Pundit

  # protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # after_action :verify_authorized, except:  :index, unless: :devise_or_pages_controller?
  # after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_controller?

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def devise_or_pages_controller?
    devise_controller? || pages_controller?
  end

  def pages_controller?
    controller_name == "pages"  # Brought by the `high_voltage` gem
  end

  def user_not_authorized
    flash[:error] = I18n.t('controllers.application.user_not_authorized', default: "You can't access this page.")
    redirect_to(root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :address, :phone, :siret, :price_per_hour, :mobile_phone, :company]
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :address, :phone, :siret, :price_per_hour, :mobile_phone, :company]
  end
end
