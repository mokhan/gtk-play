class ApplicationShellPresenter
  def initialize(view)
    @view = view
  end

  def present
    @view.set_title("Hello World")
    @view.set_title("Hello World")
    @view.signal_connect "destroy" do
      Gtk.main_quit
    end
    @view.set_default_size 250, 200
    @view.set_window_position Gtk::Window::POS_CENTER
    @view.show_all
  end
end
