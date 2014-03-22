require "spec_helper"

describe EventAggregator do
  let(:subject) { EventAggregator.new }

  context "when publishing an event" do
    let(:hello_subscriber) { double("hello_subscriber", hello: true, nada: nil) }
    let(:other_hello_subscriber) { double("other_hello_subscriber", hello: true, nada: nil) }
    let(:goodbye_subscriber) { double("goodbye_subscriber", hello: false, nada: nil) }

    before :each do
      subject.subscribe(:hello, hello_subscriber)
      subject.subscribe(:hello, other_hello_subscriber)
      subject.subscribe(:goodbye, goodbye_subscriber)

      subject.publish(:hello, 'mo', 'kha')
    end

    it "notifies all subscribers of that event" do
      hello_subscriber.should have_received(:hello).with('mo', 'kha')
      other_hello_subscriber.should have_received(:hello).with('mo', 'kha')
    end

    it "does not notify subscribers of other events" do
      goodbye_subscriber.should_not have_received(:hello)
    end

    it "does nothing when there are not subscribers" do
      subject.publish(:nada)
      hello_subscriber.should_not have_received(:nada)
      other_hello_subscriber.should_not have_received(:nada)
      goodbye_subscriber.should_not have_received(:nada)
    end
  end
end
