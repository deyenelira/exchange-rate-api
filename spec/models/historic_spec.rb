require 'rails_helper'

RSpec.describe Historic, :type => :model do

  subject { described_class.new(success: true,  timestamp: 1_650_135_543, base: 'BRL', date: '2022-04-16', rates: {'USD' => 0.212671}) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is invalid with invalid attributes' do 
    subject.success = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid with invalid attributes' do 
    subject.success = true
    subject.date = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid with invalid attributes' do 
    subject.success = true
    subject.date = '2022-04-16'
    subject.timestamp = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid with invalid attributes' do 
    subject.success = true
    subject.date = '2022-04-16'
    subject.timestamp = 1_650_135_543
    subject.rates = nil
    expect(subject).to_not be_valid
  end
end