class MenuBarBuilder
  def initialize(menus = [])
    @menus = menus
  end

  def with(menu)
    @menus.push(menu)
    self
  end

  def add_to(view)
    #menu_bar = Create.menu_bar
    menu_bar = view.menu_bar
    @menus.each do |menu|
      menu_bar.append(menu)
    end
    #view.add(Create.vertical_box(menu_bar))
  end
end
