class EventsRegistration
  extend Nasty::Command

  def self.run(container)
    event_aggregator = container.resolve(:event_aggregator)
    event_aggregator.subscribe(:halt, ShutdownCommand.new)
    event_aggregator.subscribe(:clicked, container.resolve(:stock_query))
  end
end
