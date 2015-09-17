require "test_helper"

class DonorTest < ActiveSupport::TestCase
  def donor
    @donor ||= Donor.new
  end

  def test_valid
    assert donor.valid?
  end
end
