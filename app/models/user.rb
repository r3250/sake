class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


 validates :last_name, presence: true
 validates :first_name, presence: true
 validates :last_kana, presence: true
 validates :first_kana, presence: true
 validates :nickname, presence: true
 validates :email, presence: true



  has_many :sake_posts
  has_many :sake_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  acts_as_paranoid
end
