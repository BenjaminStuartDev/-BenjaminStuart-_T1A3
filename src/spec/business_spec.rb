# frozen_string_literal: true

require './business'
require './staff'
require './menuitems'

describe Business do
  let(:business) { Business.new }

  it 'can be instantiated' do
    expect(business).not_to be_nil
    expect(business).to be_an_instance_of Business
  end

  describe '#add_staff_prompt' do
    it 'Adds a staff member to the staff array' do
      allow(business).to receive(:gets).and_return('Y', 'John', 'Y', 'Password', 'Y', 'N')
      business.add_staff_prompt
      expect(business.staff).to eq([Staff.new('John', 'Password')])
    end
    it 'Allows multiple staff to be added at the same time' do
      allow(business).to receive(:gets).and_return('Y', 'John', 'Y', 'Password1', 'Y', 'Y', 'Wick', 'Y', 'Password2', 'Y', 'N')
      business.add_staff_prompt
      expect(business.staff).to eq([Staff.new('John', 'Password1'), Staff.new('Wick', 'Password2')])
    end
    it 'Allows no staff to be added' do
      allow(business).to receive(:gets).and_return('N')
      business.add_staff_prompt
      expect(business.staff).to eq([])
    end
  end

  describe '#create_staff' do
    it 'returns a new staff object' do
      allow(business).to receive(:gets).and_return('John', 'Y', 'Password', 'Y')
      expect(business.create_staff).to eq(Staff.new('John', 'Password'))
    end
  end

  describe '#get_cafe_name' do
    it 'returns cafe_name based on user input' do
      allow(Business).to receive(:gets).and_return('Blues Cafe', 'Y')
      expect(Business.get_cafe_name).to eq('Blues Cafe')
    end
  end
end
