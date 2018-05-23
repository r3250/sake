class SakeComment < ApplicationRecord
	belongs_to :user
	belongs_to :sake_post

    validates :comment, presence: true
    validates :comment, length: { in: 1..200 }

end
