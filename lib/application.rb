require 'rubygems'
require 'bundler'
Bundler.require(:default)

Dir["lib/**/*.rb"].each do |file|
  $:.unshift(File.dirname(file)) unless $:.include?(File.dirname(file))
  require File.basename(file)
end

class Application
  def run(arguments)
    Gtk.init
    container = bootstrap_container
    bootstrap_events_with(container.resolve(:event_aggregator))
    Spank::IOC.resolve(:shell_presenter).present
    Gtk.main
  end

  private

  def bootstrap_container
    container = Spank::Container.new
    container.register(:event_aggregator) { EventAggregator.new }.as_singleton
    container.register(:shell) { ApplicationShell.new }.as_singleton
    container.register(:shell_presenter) { |x| x.build(ApplicationShellPresenter) }
    Spank::IOC.bind_to(container)
    container
  end

  def bootstrap_events_with(event_aggregator)
    event_aggregator.subscribe(:halt, ShutdownCommand.new)
  end
end
