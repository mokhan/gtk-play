require "window"

class ApplicationShell < Window
  def initialize
    super
    modify_bg(Gtk::STATE_NORMAL, Gdk::Color.new(6400, 6400, 6440))
    self.maximize
  end
end
