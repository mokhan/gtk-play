require 'rubygems'

Dir["lib/**/*.rb"].each do |file|
  $:.unshift(File.dirname(file)) unless $:.include?(File.dirname(file))
  require File.basename(file)
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
