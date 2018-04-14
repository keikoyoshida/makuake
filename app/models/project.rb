class Project < ApplicationRecord
  has_many :tags, through: :project_tags
  has_many :project_tags, dependent: :destroy
  # the following tables will be used later
  # has_many :supporters, reports, support_comments, couses, products
  belongs_to :user
  belongs_to :project_type
  belongs_to :category

  mount_uploader :heading_movie, ImageUploader
  mount_uploaders :content_images, ImageUploader
  serialize :content_images, JSON

  before_create :serialize_content_images

  attr_accessor :remaining_days

  validates :title, presence: true
  validates :heading_movie, presence: true
  validates :content_html, presence: true
  validates :deadline, presence: true

  private
  def serialize_content_images
    content_images.to_json
  end
end


