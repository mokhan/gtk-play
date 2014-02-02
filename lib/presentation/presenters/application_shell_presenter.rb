class ApplicationShellPresenter
  def initialize(shell, event_aggregator)
    @view = shell
    @event_aggregator = event_aggregator
  end

  def present
    @view.set_title("Hello World")
    @view.bind_to(self)
    Build.menu_bar.with(File.menu(@event_aggregator)).add_to(@view)
    @view.display("leonardo.jpg")
    @view.show_all
  end

  def correct_clicked
    puts "clicked on correct"
  end

  def incorrect_clicked
    puts "clicked on incorrect"
  end

  def shutdown
    Publish.event(:halt)
  end
end
