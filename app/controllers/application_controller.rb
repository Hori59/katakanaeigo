class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # deviseコントローラーにストロングパラメータを追加
  before_action :configure_permitted_parameters, if: :devise_controller?

  include WordsHelper

  protected

  def configure_permitted_parameters
    # サインアップ時にid、nameのストロングパラメータを追加
    devise_parameter_sanitizer.permit :sign_up, keys: [:id, :name]

    # アカウント編集時にid、name、self_introductionのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:id, :name, :self_introduction, :profile_image])
  end
end
