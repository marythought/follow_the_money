class Donor < ActiveRecord::Base
  has_many :donations
  has_many :organizations, through: :donations

  validates :name, presence: true

  default_scope -> { order('name ASC') }
end
