# frozen_string_literal: true

require './business'
require 'io/console'

describe Business do
  let(:business) { Business.new }

  it 'can be instantiated' do
    expect(business).not_to be_nil
    expect(business).to be_an_instance_of Business
  end

  describe '#initialises Business with "empty" class variables' do
    it 'sets @cafe_name to nil' do
      expect(business.cafe_name).to eq(nil)
    end
    it 'sets @staff to empty array' do
      expect(business.staff).to eq([])
    end
    it 'sets @menu_items to empty array' do
      expect(business.menu_items).to eq([])
    end
    it 'sets @tables to empty array' do
      expect(business.tables).to eq([])
    end
  end

  describe '#add_first_manager' do
    it 'adds a new Staff object to the @staff attribute of business' do
      business.add_first_manager('name', 'password')
      expect(business.staff[0]).not_to eq(nil)
    end
  end

  describe '#create_staff' do
    it 'returns a new Staff object' do
      allow(STDIN).to receive(:gets).and_return('name', 'Y', 'Password', 'Y')
      expect(business.create_staff).to be_an_instance_of Staff
    end
  end

  describe '#create_menu_item' do
    it 'returns a new MenuItem object' do
      allow(STDIN).to receive(:gets).and_return('Name', 'Y', '10', 'Y', 'Y', 'Ingredient', 'N')
      expect(business.create_menu_item).to be_an_instance_of MenuItem
    end
    it 'returns a new MenuItem object with drink = true when drink = true' do
      allow(STDIN).to receive(:gets).and_return('Name', 'Y', '10', 'Y', 'Y', 'Ingredient', 'N')
      expect(business.create_menu_item.drink).to eq(true)
    end
    it 'creates a new MenuItem object with drink = false when drink = false' do
      allow(STDIN).to receive(:gets).and_return('Name', 'Y', '10', 'Y', 'N', 'Ingredient', 'N')
      expect(business.create_menu_item.drink).to eq(false)
    end
  end

  describe '#tables_setup' do
    it 'Sets up an empty @staff array with correct length' do
      allow(STDIN).to receive(:gets).and_return('10', 'Y')
      business.tables_setup
      expect(business.tables.length).to eq(10)
    end
    it 'Sets up an empty @staff array containing Staff objects' do
      allow(STDIN).to receive(:gets).and_return('10', 'Y')
      business.tables_setup
      expect(business.tables[0]).to be_an_instance_of Table
    end
  end

  describe '#change_cafe_name' do
    it 'sets the @cafe_name to new_cafe_name' do
      business.change_cafe_name('new_cafe_name')
      expect(business.cafe_name).to eq('new_cafe_name')
    end
  end

  describe '#get_cafe_name' do
    it 'returns the cafe_name based on the users input' do
      allow(STDIN).to receive(:gets).and_return('Blues Cafe', 'Y')
      expect(Business.get_cafe_name).to eq('Blues Cafe')
    end
  end
end
