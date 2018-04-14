class Category < ApplicationRecord
  has_many :projects, dependent: :restrict_with_error

  validates :category, uniqueness: true
end
