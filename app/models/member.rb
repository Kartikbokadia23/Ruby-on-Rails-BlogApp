# frozen_string_literal: true

class Member < ApplicationRecord
  validates_presence_of :name
  has_many :blogs, dependent: :destroy
  belongs_to :role
end
