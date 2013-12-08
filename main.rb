require 'gtk2'


class ApplicationShell < Gtk::Window
  def initialize
    super
    set_title("Hello World")
    signal_connect "destroy" do
      Gtk.main_quit
    end
    set_default_size 250, 200
    set_window_position Gtk::Window::POS_CENTER
    show
  end
end

Gtk.init
window = ApplicationShell.new
Gtk.main
