class SakePost < ApplicationRecord
	has_many :sake_tags
	has_many :favorites
	has_many :sake_comments
	belongs_to :user
	attachment :image
end
