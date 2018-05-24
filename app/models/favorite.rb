class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :sake_post

 validates :user_id, presence: true
 validates :sake_post_id, presence: true


end
