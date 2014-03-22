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

    container = Spank::Container.new
    ContainerConfiguration.then(EventsRegistration).then(LoadModules).run(container)
    container.resolve(:application_controller).run(:shell_presenter)
    Gtk.main
  end
end
