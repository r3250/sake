class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
  		where(conditions).where(["nickname = :value OR lower(email) = lower(:value)", { :value => login}]).first
  	else
  		where(conditions).first
  	end
  end

KANA_REGEXP = /\A([ァ-ン]|ー)+\z/

 validates :last_name, presence: true
 validates :first_name, presence: true
 validates :last_kana, presence: true
 validates :last_kana, format: { with: KANA_REGEXP, message: "はカタカナのみ使用できます" }, if: "last_kana.present?"
 validates :first_kana, presence: true
 validates :first_kana, format: { with: KANA_REGEXP, message: "はカタカナのみ使用できます" }, if: "first_kana.present?"
 validates :nickname, presence: true
 validates :nickname, length: { in: 1..24 }
 validates :email, presence: true



  has_many :sake_posts
  has_many :sake_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  acts_as_paranoid


end
