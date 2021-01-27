class Member < ApplicationRecord
  has_many :blogs, dependent: :destroy
  belongs_to :role
end
