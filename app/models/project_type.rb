class ProjectType < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_many :projects, dependent: :nullify

  validates :type, uniqueness: true
end
