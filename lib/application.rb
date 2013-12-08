require 'gtk2'
require 'presentation/windows/application_shell'

class Application
  def run(arguments)
    Gtk.init
    ApplicationShell.new
    Gtk.main
  end
end
