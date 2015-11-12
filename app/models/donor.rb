class Donor < ActiveRecord::Base
  has_many :donations
  has_many :organizations, through: :donations

  validates :name, presence: true

  default_scope -> { order('name ASC') }

  def fuzzy_match(donor)
    search_array = []
    Donor.all.each do | donor |
      search_array << donor.name
    end
    FuzzyMatch.new(search_array).find("#{donor}")
  end
end

