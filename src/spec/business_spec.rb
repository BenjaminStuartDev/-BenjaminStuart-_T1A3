# frozen_string_literal: true

require './business'

describe Business do
  let(:business) { Business.new }

  it 'can be instantiated' do
    expect(business).not_to be_nil
    expect(business).to be_an_instance_of Business
  end

  describe '.set_cafe_name' do
    it 'sets @cafe_name' do
      allow(business).to receive(:gets).and_return('Blues Cafe', 'Y')
      business.set_cafe_name
      expect(business.cafe_name).to eq('Blues Cafe')
    end

    it 'allows for @cafe_name confirmation' do
      allow(business).to receive(:gets).and_return('Blues Cafe', 'N', 'Reds Cafe', 'Y')
      business.set_cafe_name
      expect(business.cafe_name).to eq('Reds Cafe')
    end

    it 'does not allow empty @cafe_name' do
      allow(business).to receive(:gets).and_return('', 'Blues Cafe', 'Y')
      business.set_cafe_name
      expect(business.cafe_name).to eq('Blues Cafe')
    end
  end
end
