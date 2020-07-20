class Contact < ApplicationRecord
  validates :name, :presence => {:message => '名前を入力してください'}
  validates :email, :presence => {:message => 'メールアドレスを入力してください'}
  validates :body, :presence => {:message => 'お問い合わせ内容を入力してください'}
end
