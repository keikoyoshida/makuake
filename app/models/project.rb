class Project < ApplicationRecord
  # has_many :tags, through: :project_tag
  # has_many :project_tags
  # has_many :supporters, reports, support_comments, couses, products
  belongs_to :user
  belongs_to :project_type

  mount_uploader :heading_movie, ImageUploader
  mount_uploader :content_image, ImageUploader

  attr_accessor :remaining_days
end
