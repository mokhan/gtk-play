class StockService
  def initialize(http_gateway = HttpGateway.new)
    @http_gateway = http_gateway
  end

  #http://download.finance.yahoo.com/d/quotes.csv?s=%40%5EDJI,GOOG&f=nsl1op&e=.csv
  def fetch(symbol)
    map_from(@http_gateway.get('http://download.finance.yahoo.com/d/quotes.csv', {s: 'GOOG', f: 'nsl1', e: '.csv'}))
  end

  private

  def map_from(response)
    name, symbol, price = response.body.split(',')
    Stock.new(name, symbol, price.to_f)
  end
end
