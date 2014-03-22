class ShellView
  attr_reader :window, :menubar, :textbox

  def initialize(event_aggregator, window, menubar, symbol_textbox, output_view, builder)
    @event_aggregator = event_aggregator
    @window = window
    @menubar = menubar
    @textbox = symbol_textbox
    @output_view = output_view
    @builder = builder
    Build.menu_bar.with(File.menu(@event_aggregator)).add_to(@menubar)
    @window.fullscreen
  end

  def set_title(title)
    @window.set_title(title)
  end

  def show_all
    @window.show_all
  end

  def bind_to(presenter)
    @builder.connect_signals do |signal|
      proc { presenter.public_send(signal) }
    end
  end

  def display(text)
    @output_view.buffer.set_text(text)
  end
end
