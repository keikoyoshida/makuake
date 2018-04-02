class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :email, presence: true
  # ユーザー名3-20文字
  validates :name, length: { minimum: 3, maximum: 20 }
  # 利用規約への同意フラグ（カラムなし）
  validates :terms_of_service, acceptance: true

  has_many :projects
end
