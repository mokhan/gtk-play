class ApplicationShellPresenter
  def initialize(view, event_aggregator)
    @view = view
    @event_aggregator = event_aggregator
  end

  def present
    @view.set_title("Hello World")
    @view.signal_connect "destroy" do
      puts "publishing halt to event aggregator"
      @event_aggregator.publish(:halt)
    end
    add_menu_to(@view)
    @view.set_default_size 250, 200
    @view.set_window_position Gtk::Window::POS_CENTER
    @view.show_all
  end

  private

  def add_menu_to(view)
    view.modify_bg(Gtk::STATE_NORMAL, Gdk::Color.new(6400, 6400, 6440))
    menu_bar = Gtk::MenuBar.new

    file_menu = Gtk::Menu.new
    file_menu_item = Gtk::MenuItem.new("_File")
    file_menu_item.set_submenu(file_menu)

    exit_menu_item = Gtk::MenuItem.new("E_xit")
    exit_menu_item.signal_connect "activate" do
      @event_aggregator.publish(:halt)
    end

    file_menu.append(exit_menu_item)
    menu_bar.append(file_menu_item)

    vbox = Gtk::VBox.new(false, 2)
    vbox.pack_start(menu_bar, false, false, 0)
    view.add(vbox)
  end
end
