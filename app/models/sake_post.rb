class SakePost < ApplicationRecord
	# acts_as_taggable_on :tag_lists
	acts_as_taggable
	has_many :favorites, dependent: :destroy
	has_many :sake_comments, dependent: :destroy
	belongs_to :user, -> { with_deleted }
	attachment :image

   	validates :sake_name, presence: true
   	validates :shop_name, presence: true
   	validates :caption, presence: true
   	validates :image, presence: true

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
    end
    scope :sake, -> { joins(:user).where("deleted_at IS NULL") }

end
