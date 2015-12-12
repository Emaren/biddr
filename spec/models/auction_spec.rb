require 'rails_helper'
require 'auction'


RSpec.describe Auction, type: :model do
  describe Auction do
    it "has valid parameters"
    auction = Auction.new
    auction.title != nil
  end
end
