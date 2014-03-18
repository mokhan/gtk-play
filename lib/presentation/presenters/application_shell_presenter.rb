class ApplicationShellPresenter
  attr_reader :view

  def initialize(shell, event_aggregator, stock_service)
    @view = shell
    @event_aggregator = event_aggregator
    @stock_service = stock_service
  end

  def present
    @view.set_title("Hello World")
    @view.show_all
  end

  def backspace
  end

  def changed(text)
    return if @updating
    update do
      @view.display("...")
      stock = @stock_service.fetch("ARX.TO")
      @view.display(stock.to_s)
    end
  end

  def shutdown
    Publish.event(:halt)
  end

  private

  def update
    @updating = true
    yield
    @updating = false
  end
end
