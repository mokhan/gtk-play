class ApplicationController
  def initialize(container)
    @container = container
  end

  def run(presenter_key)
    presenter = @container.resolve(presenter_key)
    view = presenter.view
    view.builder = create_builder_for(presenter_key.to_s)
    view.bind_to(presenter)
    view.builder.connect_signals { |signal| Proc.new { presenter.public_send(signal) } }
    presenter.present
  end

  private

  def create_builder_for(presenter_key)
    builder = Gtk::Builder.new
    file = File.join(File.dirname(__FILE__), 'windows', "#{presenter_key.gsub(/\_presenter/, '')}.xml")
    builder.add_from_file(file)
    builder
  end
end
