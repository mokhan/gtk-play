class ApplicationShell
  attr_reader :window, :menu_bar

  def initialize(event_aggregator)
    builder = Gtk::Builder.new
    file = File.join(File.dirname(__FILE__), 'shell.xml')
    builder.add_from_file(file)
    builder.connect_signals { |signal| Proc.new { publish(signal) } }
    @window = builder.get_object('window')
    @menu_bar = builder.get_object('menubar')
    @event_aggregator = event_aggregator
  end

  def set_title(title)
    @window.set_title(title)
  end

  def show_all
    @window.show_all
  end

  def bind_to(presenter)
    @presenter = presenter
    Build.menu_bar.with(File.menu(@event_aggregator)).add_to(self)
  end

  def publish(signal)
    @presenter.public_send(signal)
  end
end
