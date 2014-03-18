class Stock
  attr_reader :name, :symbol, :price

  def initialize(name, symbol, price)
    @name, @symbol, @price = name, symbol, price
  end

  def to_s
    "#{symbol}: #{name} - #{price}"
  end
end
