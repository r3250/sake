class SakePost < ApplicationRecord
	# acts_as_taggable_on :tag_lists
	acts_as_taggable
	has_many :favorites, dependent: :destroy
	has_many :sake_comments, dependent: :destroy
	belongs_to :user
	attachment :image

   validates :tag_list, presence: true

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
    end

end
