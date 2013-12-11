require 'rubygems'
require 'bundler'
Bundler.require(:default)
require_relative 'utility/command.rb'

Dir["lib/**/*.rb"].each do |file|
  $:.unshift(File.dirname(file)) unless $:.include?(File.dirname(file))
  require File.basename(file)
end

class Application
  def run(arguments)
    Gtk.init
    container = Spank::Container.new
    ContainerConfiguration.then(EventsRegistration).run(container)

    container.resolve(:shell_presenter).present
    Gtk.main
  end
end
