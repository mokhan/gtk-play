class ApplicationShell
  attr_reader :window, :menu_bar
  attr_accessor :builder

  def initialize(event_aggregator)
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
    @window = builder.get_object('window')
    @menu_bar = builder.get_object('menubar')
    Build.menu_bar.with(File.menu(@event_aggregator)).add_to(self)
  end
end
