class ContainerConfiguration
  extend Nasty::Command

  def self.run(container)
    container.register(:event_aggregator) { EventAggregator.new }.as_singleton
    container.register(:shell) { |x| x.build(ApplicationShell) }.as_singleton
    container.register(:shell_presenter) { |x| x.build(ApplicationShellPresenter) }
    Spank::IOC.bind_to(container)
  end
end

