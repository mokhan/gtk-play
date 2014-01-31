module Signal
  def on(event, &command)
    self.signal_connect(event.to_s) do |*args|
      command.call(*args)
    end
  end
end
