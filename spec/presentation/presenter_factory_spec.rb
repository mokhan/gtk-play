require "spec_helper"

describe PresenterFactory do
  let(:container) { double }
  subject { PresenterFactory.new(container) }

  describe "#create" do
    let(:presenter) { double }
    let(:view) { double(bind_to: true) }

    before :each do
      container.stub(:resolve).with(:stock_presenter).and_return(presenter)
      container.stub(:resolve).with(:stock_view).and_return(view)
    end

    let!(:result) { subject.create(:stock_presenter) }

    it "returns a new presenter" do
      result.should == presenter
    end

    it "should bind the view to the presenter" do
      view.should have_received(:bind_to).with(presenter)
    end
  end
end
