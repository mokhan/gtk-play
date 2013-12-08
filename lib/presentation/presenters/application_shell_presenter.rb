class ApplicationShellPresenter
  def initialize(view, event_aggregator)
    @view = view
    @event_aggregator = event_aggregator
  end

  def present
    @view.set_title("Hello World")
    @view.signal_connect "destroy" do
      puts "publishing halt to event aggregator"
      @event_aggregator.publish(:halt)
    end
    @view.set_default_size 250, 200
    @view.set_window_position Gtk::Window::POS_CENTER
    @view.show_all
  end
end
