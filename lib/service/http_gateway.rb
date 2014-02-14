require 'net/http'

class HttpGateway
  def get(uri, params = {})
    uri = URI(uri)
    uri.query = URI.encode_www_form(params) if params.keys.any?
    Net::HTTP.get_response(uri)
  end
end
