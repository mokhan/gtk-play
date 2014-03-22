require 'presenter'

class ShellPresenter < Presenter
  def initialize(shell_view, stock_service)
    @view = shell_view
  end

  def present
    @view.set_title("Hello World")
    @view.show_all
  end
end
