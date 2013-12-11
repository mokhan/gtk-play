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
