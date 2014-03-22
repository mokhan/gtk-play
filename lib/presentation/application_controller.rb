class ApplicationController
  def initialize(presenter_factory)
    @presenter_factory = presenter_factory
  end

  def run(presenter_key)
    @presenter_factory.create(presenter_key).present
  end
end
