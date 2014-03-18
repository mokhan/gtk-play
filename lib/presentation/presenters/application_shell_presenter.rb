class ApplicationShellPresenter
  attr_reader :view

  def initialize(shell, event_aggregator)
    @view = shell
    @event_aggregator = event_aggregator
  end

  def present
    @view.set_title("Hello World")
    @view.show_all
  end

  def shutdown
    Publish.event(:halt)
  end
end
