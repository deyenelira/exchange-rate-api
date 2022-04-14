require 'test_helper'

class HistoricTest < ActiveSupport::TestCase

  #missing params
  test "should not save historic without all required params" do
    historic = Historic.new({ base: "BRL",
                              success: true,
                              timestamp: 123_739_827 })

    assert_not historic.save, "Saved the historic without all required params"
  end

  #with all required params
  test "should save historic" do
    historic = Historic.new({ success: true,
                              timestamp: 28_137_212_891,
                              historical: true,
                              base: 'MyString',
                              date: 'MyString',
                              rates: { "USD": 0.212784 } })

    assert historic.save, "Saved the historic"
  end
end
