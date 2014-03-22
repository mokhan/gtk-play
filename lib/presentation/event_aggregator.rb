class EventAggregator
  def initialize(subscribers = Hash.new([]))
    @subscribers = subscribers
  end

  def publish(event, *args)
    subscribers = subscribers_for(event)
    subscribers.each do |subscriber|
      subscriber.public_send(event, *args)
    end
  end

  def subscribe(event, subscriber)
    @subscribers[event] = [] unless @subscribers.key?(event)
    @subscribers[event].push(subscriber)
  end

  private

  def subscribers_for(event)
    @subscribers[event.to_sym]
  end
end
