class SakeTag < ApplicationRecord
	belongs_to :tag
	belongs_to :sake_post
end
