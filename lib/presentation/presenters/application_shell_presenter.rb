class ApplicationShellPresenter
  def initialize(view, event_aggregator)
    @view = view
    @event_aggregator = event_aggregator
  end

  def present
    @view.set_title("Hello World")
    @view.signal_connect "destroy" do
      @event_aggregator.publish(:halt)
    end
    Build.menu_bar.with(File.menu(@event_aggregator)).add_to(@view)
    @view.show_all
  end
end
