# frozen_string_literal: true

require './Interface'

describe Interface do
  let(:interface) { Interface.new }

  it 'can be instantiated' do
    expect(interface).not_to be_nil
    expect(interface).to be_an_instance_of Interface
  end

  describe '.set_cafe_name' do
    it 'sets @cafe_name' do
      allow(interface).to receive(:gets).and_return('Blues Cafe', 'Y')
      interface.set_cafe_name
      expect(interface.cafe_name).to eq('Blues Cafe')
    end

    it 'allows for @cafe_name confirmation' do
      allow(interface).to receive(:gets).and_return('Blues Cafe', 'N', 'Reds Cafe', 'Y')
      interface.set_cafe_name
      expect(interface.cafe_name).to eq('Reds Cafe')
    end

    it 'does not allow empty @cafe_name' do
      allow(interface).to receive(:gets).and_return('', 'Blues Cafe', 'Y')
      interface.set_cafe_name
      expect(interface.cafe_name).to eq('Blues Cafe')
    end
  end

  describe '.greet' do
    it 'prompts the user for username and password and returns [username, password]' do
      allow(interface).to receive(:gets).and_return('Benjamin', 'Password')
      expect(interface.greet).to eq(%w[Benjamin Password])
    end
  end
end
