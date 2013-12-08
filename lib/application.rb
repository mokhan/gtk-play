Dir["**/**/*.rb"].each { |file| $:.unshift(File.dirname(file)) }

require 'application_shell_presenter'
require 'application_shell'
require 'event_aggregator'

class ShutdownCommand
  def halt(*message)
    Gtk.main_quit
  end
end

class Application
  def run(arguments)
    Gtk.init
    event_aggregator = EventAggregator.new
    event_aggregator.subscribe(:halt, ShutdownCommand.new)
    presenter = ApplicationShellPresenter.new(ApplicationShell.new, event_aggregator)
    presenter.present
    Gtk.main
  end
end
