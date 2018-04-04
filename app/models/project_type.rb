class ProjectType < ApplicationRecord
  self.inheritance_column = :_type_disabled

  has_many :projects

  validates :type, uniqueness: true
end
