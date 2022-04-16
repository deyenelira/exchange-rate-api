FactoryBot.define do 
  factory :historic do
    success { true }
    timestamp { 123456789 }
    historical { true }
    base { 'BRL' }
    date { '2022-04-16' }
    rates { { 'USD' => 0.212671 } }
  end
end