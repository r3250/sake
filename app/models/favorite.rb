class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :sake_post

end
