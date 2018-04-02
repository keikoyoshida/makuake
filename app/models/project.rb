class Project < ApplicationRecord
  # has_many :tags, through: :project_tag
  # has_many :project_tags
  # has_many :supporters, reports, support_comments, couses, products
  belongs_to :user, :project_type
end
