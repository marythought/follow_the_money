class Donation < ActiveRecord::Base
  belongs_to :donor
  belongs_to :organization

  validates :amount, numericality: { greater_than: 0 }
  validates :date, presence: true

  default_scope -> { order('date DESC') }
end
