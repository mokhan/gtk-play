require 'gtk2'
require 'presentation/windows/application_shell'
require 'presentation/presenters/application_shell_presenter'

class Application
  def run(arguments)
    Gtk.init
    presenter = ApplicationShellPresenter.new(ApplicationShell.new)
    presenter.present
    Gtk.main
  end
end
