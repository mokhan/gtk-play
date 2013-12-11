class CompositeCommand
  def initialize(first, last)
    @first = first
    @last = last
  end

  def run(*args)
    @first.run(*args)
    @last.run(*args)
  end
end
