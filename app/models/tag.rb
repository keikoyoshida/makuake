class Tag < ApplicationRecord
  has_many :projects, through: :project_tags
  has_many :project_tags, dependent: :destroy
end

  validates :tag, uniqueness: true
end
