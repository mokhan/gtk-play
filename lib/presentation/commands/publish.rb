class Publish
  include Nasty::Command

  def initialize(event, *message)
    @event = event
    @message = *message
  end

  def run(event_aggregator)
    event_aggregator.publish(@event, @message)
  end

  def self.event(event, *message)
    event_aggregator = Spank::IOC.resolve(:event_aggregator)
    Publish.new(event, *message).run(event_aggregator)
  end
end
