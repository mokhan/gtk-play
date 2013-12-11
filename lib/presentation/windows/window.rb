class Window < Gtk::Window
  def initialize
    super
  end

  def on(event, &command)
    self.signal_connect(event.to_s) do
      command.call(self)
    end
  end
end
