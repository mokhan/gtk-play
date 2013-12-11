module Command
  def then(other_command)
    CompositeCommand.new(self, other_command)
  end
end
