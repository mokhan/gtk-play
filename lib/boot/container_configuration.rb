class ContainerConfiguration
  extend Nasty::Command

  def self.run(container)
    builder = Gtk::Builder.new
    file = File.join(File.dirname(__FILE__), '..', 'presentation', 'windows', "shell.xml")
    builder.add_from_file(file)

    container.register(:builder) { builder }.as_singleton
    container.register(:window) { builder.get_object('window') }.as_singleton
    container.register(:menubar) { builder.get_object('menubar') }.as_singleton
    container.register(:symbol_textbox) { builder.get_object('symbol_textbox') }.as_singleton
    container.register(:submit_button) { builder.get_object('submit_button') }.as_singleton
    container.register(:output_view) { builder.get_object('output_textarea') }.as_singleton
    container.register(:statusbar) { builder.get_object('statusbar') }.as_singleton

    container.register(:event_aggregator) { EventAggregator.new }.as_singleton
    container.register(:shell_view) { |x| x.build(ShellView) }.as_singleton
    container.register(:shell_presenter) { |x| x.build(ShellPresenter) }.as_singleton
    container.register(:application_controller) { |x| x.build(ApplicationController) }.as_singleton
    container.register(:presenter_factory) { |x| x.build(PresenterFactory) }.as_singleton
    container.register(:stock_service) { |x| StockService.new }.as_singleton
    container.register(:stock_query) { |x| x.build(StockQuery) }
    Spank::IOC.bind_to(container)
  end
end

