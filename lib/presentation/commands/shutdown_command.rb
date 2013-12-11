class ShutdownCommand
  def halt(*message)
    Gtk.main_quit
  end
end
