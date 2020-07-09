Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # デバイス
  devise_for :users, skip: :all
  devise_scope :user do
    # 新規登録画面表示
    get  'users/sign_up',       to: 'users/registrations#new',     as: :new_user_registration
    # 新規登録
    post 'users',               to: 'users/registrations#create',  as: :user_registration
    # ユーザ削除
    delete 'users',             to: 'users/registrations#destroy', as: :destroy_user_registration

    # ログイン画面表示
    get 'users/log_in',         to: 'users/sessions#new',          as: :new_user_session
    # ログイン
    post 'users/log_in',        to: 'users/sessions#create',       as: :user_session
    # ログアウト
    delete 'users/log_out',     to: 'users/sessions#destroy',      as: :destroy_user_session

    # パスワード変更画面を表示
    get '/users/password/edit', to: 'users/passwords#edit',        as: :edit_user_password
    # パスワードを変更
    patch '/users/password',    to: 'users/passwords#update',      as: :user_password
  end
end
