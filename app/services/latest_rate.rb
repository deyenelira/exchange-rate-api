# historical rates
class LatestRate
  require 'uri'
  require 'net/http'
  require 'openssl'

  def initialize
  end

  def call
    { data: query }
  end

  def query
    url = URI('https://fixer-fixer-currency-v1.p.rapidapi.com/latest?base=BRL&symbols=USD')

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request['X-RapidAPI-Host'] = 'fixer-fixer-currency-v1.p.rapidapi.com'

    #Inserir chave de acesso
    #request['X-RapidAPI-Key'] = ''

    response = http.request(request)
    CreateHistoric.new(JSON.parse(response.read_body)).call

    JSON.parse(response.read_body)
  end
end


