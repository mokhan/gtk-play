require "spec_helper"

describe EventAggregator do
  let(:sut) { EventAggregator.new }

  context "when publishing an event" do
    let(:hello_subscriber) { double("hello_subscriber", hello: true) }
    let(:goodbye_subscriber) { double("goodbye_subscriber", hello: false) }

    before :each do
      sut.subscribe(:hello, hello_subscriber)
      sut.subscribe(:goodbye, goodbye_subscriber)

      sut.publish(:hello, 'mo', 'kha')
    end

    it "notifies all subscribers of that event" do
      hello_subscriber.should have_received(:hello).with('mo', 'kha')
    end

    it "does not notify subscribers of other events" do
      goodbye_subscriber.should_not have_received(:hello)
    end
  end
end
