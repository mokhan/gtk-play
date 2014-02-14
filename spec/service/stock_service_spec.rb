require "spec_helper"

describe StockService do
  let(:sut) { StockService.new }

  context "when given a known stock symbol" do
    it "fetches the most recent price for a given stock" do
      result = sut.fetch("GOOG")
      result.symbol.should == "\"GOOG\""
      result.price.should be > 0
      result.name.should == "\"Google Inc.\""
    end
  end
end
