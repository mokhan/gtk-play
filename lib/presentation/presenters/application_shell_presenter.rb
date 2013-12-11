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
    menu_bar = create_menu_bar.append(create_menu_item("_File", create_menu.append(create_menu_item("_Import", create_import_menu)).append(create_exit_menu)))
    view.add(create_vertical_box(menu_bar))
  end

  def create_vertical_box(menu_bar)
    vbox = Gtk::VBox.new(false, 2)
    vbox.pack_start(menu_bar, false, false, 0)
    vbox
  end

  def create_menu
    Gtk::Menu.new
  end

  def create_menu_item(name, sub_menu = nil)
    menu_item = Gtk::MenuItem.new(name)
    menu_item.set_submenu(sub_menu) if sub_menu
    menu_item
  end

  def create_menu_bar
    Gtk::MenuBar.new
  end

  def create_import_menu
    import_menu = create_menu
    import_menu.append(create_menu_item("Import news feed..."))
    import_menu.append(create_menu_item("Import bookmarks..."))
    import_menu.append(create_menu_item("Import mail..."))
    import_menu
  end

  def create_exit_menu
    menu_item = create_menu_item("E_xit")
    menu_item.signal_connect "activate" do
      @event_aggregator.publish(:halt)
    end
    menu_item
  end
end
