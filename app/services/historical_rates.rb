# historical rates
class HistoricalRates
  require 'uri'
  require 'net/http'
  require 'openssl'

  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def call
    return data if date_is_valid && check_params

    false
  end

  def data
    { data: query }
  end

  def query
    result = []
    dates = date_range(@start_date.to_date, @end_date.to_date, 1.day)

    dates.each do |date|
      url = URI("https://fixer-fixer-currency-v1.p.rapidapi.com/#{date.to_date}?base=BRL&symbols=USD")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request['X-RapidAPI-Host'] = 'fixer-fixer-currency-v1.p.rapidapi.com'

      #Inserir chave de acesso
      #request['X-RapidAPI-Key'] = ''

      response = http.request(request)
      CreateHistoric.new(JSON.parse(response.read_body)).call

      result << JSON.parse(response.read_body)
    end

    result
  end

  def date_range(start, stop, step)
    start = start.to_date
    stop = stop.to_date
    dates = [start]
    result = [start.to_s]
    while dates.last <= (stop - step)
      result << (dates.last + step).to_s
      dates << (dates.last + step)
    end

    result
  end

  def date_is_valid
    Date.parse(@start_date)
    Date.parse(@end_date)

    true
  rescue ArgumentError
    false
  end

  def check_params
    return false if @end_date.to_date < @start_date.to_date
    return false if @start_date > DateTime.now || @end_date > DateTime.now

    true
  end
end
