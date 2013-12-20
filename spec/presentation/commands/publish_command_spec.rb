require "spec_helper"

describe Publish do
  context "when publishing an event" do
    let(:event_aggregator) { double("event_aggregator", :publish => true) }

    before :each do
      allow(Spank::IOC).to receive(:resolve).and_return(event_aggregator)
    end

    it "publishes the event using the event aggregator (no message)" do
      Publish.event(:hello)
      expect(event_aggregator).to have_received(:publish)
    end

    it "publishes the event using the event aggregator (with message)" do
      Publish.event(:hello, "you")
      expect(event_aggregator).to have_received(:publish).with(:hello, ["you"])
    end
  end
end
