class LoadModules
  extend Nasty::Command

  def self.run(container)
    container.resolve(:builder).connect_signals do |signal|
      proc { Publish.event(signal) }
    end
  end
end
