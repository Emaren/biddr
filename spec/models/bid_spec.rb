require 'rails_helper'
require 'bid'
RSpec.describe Bid, type: :model do
  describe Bid do
    it "has valid parameters"
    bid = Bid.new
    bid.amount != nil
  end
end
