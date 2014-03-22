class StockQuery
  def initialize(symbol_textbox, shell_view, stock_service)
    @symbol_textbox = symbol_textbox
    @stock_service = stock_service
    @shell_view = shell_view
  end

  def clicked(payload)
    stock = @stock_service.fetch(@symbol_textbox.text)
    @shell_view.display(stock.to_s)
  end
end
