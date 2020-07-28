ActiveAdmin.register Word do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # 編集可能なパラメータ
  permit_params :user_id, :name, :english_name, :description, :is_published

  scope :is_published do |words|
    words.where(:is_published => true)
  end

  # 一覧ページ
  index do
    selectable_column
    id_column
    column 'ユーザ' do |word|
      word.user
    end
    column :name
    column :english_name
    column :is_published
    column :created_at
    column :updated_at
    actions
  end

  # 投稿フォーム
  form do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.all
      f.input :name
      f.input :english_name
      f.input :description
      f.input :is_published, as: :select, collection: { "下書き" => 0, "公開" => 1 }
    end
    f.actions
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :name, :english_name, :description, :is_published]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
