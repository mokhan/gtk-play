class ContainerConfiguration
  extend Nasty::Command

  def self.run(container)
    container.register(:event_aggregator) { EventAggregator.new }.as_singleton
    container.register(:shell) { |x| x.build(ApplicationShell) }.as_singleton
    container.register(:shell_presenter) { |x| x.build(ApplicationShellPresenter) }.as_singleton
    container.register(:application_controller) { |x| x.build(ApplicationController) }.as_singleton
    container.register(:stock_service) { |x| StockService.new }.as_singleton
    Spank::IOC.bind_to(container)
  end
end

