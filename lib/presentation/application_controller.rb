class ApplicationController
  def initialize(container)
    @container = container
  end

  def run(presenter)
    @container.resolve(presenter).present
  end
end
