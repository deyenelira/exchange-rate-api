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
    if check_params
      { data: query }
    else
      { data: { error: 'invalid date' } }
    end
  end

  def check_params
    if @end_date.eql?('') || @start_date.eql?('')
      return false
    elsif @end_date.to_date < @start_date.to_date 
      return false
    elsif @start_date > DateTime.now || @end_date > DateTime.now 
      return false
    end
    true
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
      request['X-RapidAPI-Key'] = '8829aa2d6amsh168397e64463c2fp1cdb0djsne545e1442df1'

      response = http.request(request)
      p JSON.parse(response.read_body)
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
end
