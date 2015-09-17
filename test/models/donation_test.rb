require "test_helper"

class DonationTest < ActiveSupport::TestCase
  def donation
    @donation ||= Donation.new
  end

  def test_valid
    assert donation.valid?
  end
end
