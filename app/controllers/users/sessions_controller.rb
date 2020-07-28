# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # ユーザ復活機能作りたかったけど手に負えないので後回し
  # def log_in
  #   # binding.pry
  #   @user = User.with_deleted.find_by(email: params[:user][:email].downcase)
  #   if @user && @user.deleted_at == true
  #     render "users/user_restore"
  #   elsif @user && @user.valid_password?(params[:user][:password])
  #     session[:id] = @user.id
  #     flash[:notice] = "ログインしました"
  #     redirect_to user_path(@user)
  #   else
  #     flash[:alert]  = "メールアドレスまたはパスワードが間違っています"
  #     render 'new'
  #   end
  # end


  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
