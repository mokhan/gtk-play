require "window"

#class ApplicationShell < Window
  #def initialize
    #super
    #modify_bg(Gtk::STATE_NORMAL, Gdk::Color.new(6400, 6400, 6440))
    #self.maximize
  #end

  #def bind_to(presenter)
    #self.on(:destroy) do
      #presenter.shutdown
    #end
  #end
#end

class ApplicationShell
  def initialize
    builder = Gtk::Builder.new
    file = File.join(File.dirname(__FILE__), 'tutorial.xml')
    builder.add_from_file(file)
    builder.connect_signals { |signal| Proc.new { publish(signal) } }
    @window = builder.get_object('window')
  end

  def set_title(title)
    @window.set_title(title)
  end

  def show_all
    @window.show_all
  end

  def bind_to(presenter)
    @presenter = presenter
  end

  def publish(signal)
    @presenter.public_send(signal)
  end
end
