class Organization < ActiveRecord::Base
  has_many :donations
  has_many :donors, through: :donations

  default_scope -> { order('name ASC') }

  validates :name, presence: true
end

