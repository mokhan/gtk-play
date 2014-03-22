require 'presenter'

class ShellPresenter < Presenter
  def initialize(shell_view, stock_service)
    @view = shell_view
    @stock_service = stock_service
  end

  def present
    @view.set_title("Hello World")
    @view.show_all
  end

  def clicked
    stock = @stock_service.fetch(@view.textbox.text)
    @view.display(stock.to_s)
  end

  def shutdown
    Publish.event(:halt)
  end
end
