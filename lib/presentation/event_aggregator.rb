class EventAggregator
  def initialize(subscribers = {})
    @subscribers = subscribers
  end

  def publish(event, *args)
    subscribers = subscribers_for(event)
    puts "all #{@subscribers}"
    puts "found #{subscribers}"
    subscribers.each do |subscriber|
      puts "publishing #{event} to #{subscriber}"
      subscriber.public_send(event, args)
    end
  end

  def subscribe(event, subscriber)
    @subscribers[event] = [] unless @subscribers.key?(event)
    @subscribers[event].push(subscriber)
  end

  private

  def subscribers_for(event)
    @subscribers[event]
  end
end
