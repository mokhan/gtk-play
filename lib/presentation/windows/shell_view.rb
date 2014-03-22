class ShellView
  attr_reader :window, :menu_bar, :textbox
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
    @textbox = builder.get_object('symbol_textbox')
    @submit_button = builder.get_object('submit_button')
    @output_view = builder.get_object('output_textarea')
    @status_bar = builder.get_object('statusbar')
    builder.connect_signals do |signal|
      proc { presenter.public_send(signal) }
    end
    Build.menu_bar.with(File.menu(@event_aggregator)).add_to(@menu_bar)
    @window.fullscreen
  end

  def display(text)
    @output_view.buffer.set_text(text)
  end
end
