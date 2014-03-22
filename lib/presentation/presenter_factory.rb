class PresenterFactory
  def initialize(container)
    @container = container
  end

  def create(presenter_key)
    presenter = @container.resolve(presenter_key)
    @container.resolve(create_view_key_from(presenter_key)).bind_to(presenter)
    presenter
  end

  private

  def create_view_key_from(presenter_key)
    presenter_key.to_s.gsub(/presenter/, 'view').to_sym
  end
end
