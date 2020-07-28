ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  # 編集可能なパラメータ
  permit_params :id, :email, :name, :profile_image_id, :self_introduction, :deleted_at, :password

  # 一覧ページ
  index do
    selectable_column
    id_column
    column :name
    column '投稿数' do |user|
      user.words.count
    end
    column :created_at
    column :updated_at
    actions
  end

  # ユーザ作成フォーム
  form do |f|
    f.inputs do
      f.input :id
      f.input :name
      f.input :email
      f.input :self_introduction
      f.input :password
    end
    f.actions
  end

  # 詳細ページ
  show do |user|
    attributes_table(*user.class.columns.collect { |column| column.name.to_sym })
    panel "投稿一覧" do
      table_for user.words do
        column :name
      end
    end
    active_admin_comments
  end

  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :profile_image_id, :self_introduction, :deleted_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
