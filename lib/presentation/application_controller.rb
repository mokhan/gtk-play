class ApplicationController
  def initialize(presenter_factory)
    @presenter_factory = presenter_factory
  end

  def run(presenter_key)
    #presenter = @container.resolve(presenter_key)
    #view = presenter.view
    #view.builder = create_builder_for(presenter_key.to_s)
    #view.bind_to(presenter)
    @presenter_factory.create(presenter_key).present
  end

  private

  def create_builder_for(presenter_key)
    builder = Gtk::Builder.new
    file = File.join(File.dirname(__FILE__), 'windows', "#{presenter_key.gsub(/\_presenter/, '')}.xml")
    puts "LOADING #{presenter_key} FROM #{file}"
    builder.add_from_file(file)
    builder
  end
end
