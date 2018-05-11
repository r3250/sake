class SakeComment < ApplicationRecord
	belongs_to :user
	belongs_to :sake_post
end
