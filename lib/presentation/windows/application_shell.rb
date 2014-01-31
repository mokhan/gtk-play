require "window"

class ApplicationShell < Window
  def initialize
    super
    modify_bg(Gtk::STATE_NORMAL, Gdk::Color.new(6400, 6400, 6440))
    self.maximize
  end

  def bind_to(presenter)
    self.on(:destroy) do
      presenter.shutdown
    end

    table = Gtk::Table.new(8, 4, false)
    halign = Gtk::Alignment.new(0, 0, 0, 0)
    table.attach(halign, 0, 1, 0, 1, Gtk::FILL, Gtk::FILL, 0, 0)

    @frame = Gtk::Frame.new
    table.attach(@frame, 0, 2, 1, 3, Gtk::FILL | Gtk::EXPAND, Gtk::FILL | Gtk::EXPAND, 1, 1)

    right_button = Gtk::Button.new("Right")
    right_button.set_size_request(50, 30)
    table.attach(right_button, 3, 4, 1, 2, Gtk::FILL, Gtk::SHRINK, 1, 1)

    valign = Gtk::Alignment.new 0, 0, 0, 0
    wrong_button = Gtk::Button.new("Wrong")
    wrong_button.set_size_request(70, 30)
    valign.add(wrong_button)
    table.set_row_spacing(1, 3)
    table.attach(valign, 3, 4, 2, 3, Gtk::FILL, Gtk::FILL | Gtk::EXPAND, 1, 1)
    add(table)
  end

  def display(image)
    path = File.expand_path(image, File.dirname(__FILE__))
    @frame.add(Gtk::Image.new(path))
  end
end
