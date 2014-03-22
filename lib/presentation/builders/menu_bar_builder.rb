class MenuBarBuilder
  def initialize(menus = [])
    @menus = menus
  end

  def with(menu)
    @menus.push(menu)
    self
  end

  def add_to(menu_bar)
    @menus.each do |menu|
      menu_bar.append(menu)
    end
  end
end
