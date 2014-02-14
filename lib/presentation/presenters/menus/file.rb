class File
  def self.menu(event_aggregator)
    Create.menu_item("_File", Create.menu.append(create_add_menu).append(create_exit_menu(event_aggregator)))
  end

  def self.create_add_menu
    Create.menu_item("_Add", Create.menu.append(Create.menu_item("Stock feed...")))
  end

  def self.create_exit_menu(event_aggregator)
    menu_item = Create.menu_item("E_xit")
    menu_item.signal_connect "activate" do
      event_aggregator.publish(:halt)
    end
    menu_item
  end
end
