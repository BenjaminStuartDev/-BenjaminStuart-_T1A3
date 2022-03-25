# frozen_string_literal: true

require './business'

describe Business do
  let(:business) { Business.new }

  it 'can be instantiated' do
    expect(business).not_to be_nil
    expect(business).to be_an_instance_of Business
  end

  describe '#get_cafe_name' do
    it 'returns cafe_name based on user input' do
      allow(Business).to receive(:gets).and_return('Blues Cafe', 'Y')
      expect(Business.get_cafe_name).to eq('Blues Cafe')
    end
  end
end
