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
    view.add(Create.vertical_box(Create.menu_bar.append(create_file_menu)))
  end

  def create_file_menu
    Create.menu_item("_File", Create.menu.append(create_import_menu).append(create_exit_menu))
  end

  def create_import_menu
    Create.menu_item("_Import", Create.menu
                     .append(Create.menu_item("Import news feed..."))
                     .append(Create.menu_item("Import bookmarks..."))
                     .append(Create.menu_item("Import mail..."))
                    )
  end

  def create_exit_menu
    menu_item = Create.menu_item("E_xit")
    menu_item.signal_connect "activate" do
      @event_aggregator.publish(:halt)
    end
    menu_item
  end
end

class Create
  def self.menu_bar
    Gtk::MenuBar.new
  end

  def self.menu_item(name, sub_menu = nil)
    menu_item = Gtk::MenuItem.new(name)
    menu_item.set_submenu(sub_menu) if sub_menu
    menu_item
  end

  def self.menu
    Gtk::Menu.new
  end

  def self.vertical_box(menu_bar)
    box = Gtk::VBox.new(false, 2)
    box.pack_start(menu_bar, false, false, 0)
    box
  end
end

