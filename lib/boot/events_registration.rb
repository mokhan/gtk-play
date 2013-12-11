class EventsRegistration
  extend Nasty::Command

  def self.run(container)
    register_items_with(container.resolve(:event_aggregator))
  end

  def self.register_items_with(event_aggregator)
    event_aggregator.subscribe(:halt, ShutdownCommand.new)
  end
end
