require "spec_helper"

describe ApplicationController do
  let(:presenter_factory) { double }
  subject { ApplicationController.new(presenter_factory) }

  describe "#run" do
    it "builds a new presenter and presents it" do
      presenter = double(present: true)

      presenter_factory.stub(:create).with(:stock_presenter).and_return(presenter)

      subject.run(:stock_presenter)
      presenter.should have_received(:present)
    end
  end
end
