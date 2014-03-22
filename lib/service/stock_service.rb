class StockService
  API_URL = 'http://download.finance.yahoo.com/d/quotes.csv'
  def initialize(http_gateway = HttpGateway.new)
    @http_gateway = http_gateway
  end

  def fetch(symbol)
    map_from(@http_gateway.get(API_URL, {s: symbol, f: 'nsl1', e: '.csv'}))
  end

  private

  def map_from(response)
    name, symbol, price = response.body.split(',')
    Stock.new(name, symbol, price.to_f)
  end
end
