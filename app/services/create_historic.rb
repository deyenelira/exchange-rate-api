# create historic
class CreateHistoric

  def initialize(params)
    @params = params
  end

  def call
    historic = Historic.new(@params)

    if historic.save
      historic
    else
      historic.errors
    end
  end
end
