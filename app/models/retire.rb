class Retire < ApplicationRecord
 validates :retire_reason, length: { in: 1..75 }
 validates :retire_reason, presence: true
end
