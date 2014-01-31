require 'signal'

class Window < Gtk::Window
  include Signal

  def initialize
    super
  end
end

