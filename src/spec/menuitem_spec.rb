# # frozen_string_literal: true

require './menuitem'

describe MenuItem do
  let(:menuitem) { MenuItem.new('meal1', 13.0, %w[ingredient1 ingredient2], false) }

  it 'can be instantiated' do
    expect(menuitem).not_to be_nil
    expect(menuitem).to be_an_instance_of MenuItem
  end

  describe '#initialise' do
    it 'initialises MenuItem with name [String], price [Float], ingredients [Array] and drink [Boolean]' do
      expect(menuitem.name).to eq('meal1')
      expect(menuitem.price).to eq(13.0)
      expect(menuitem.ingredients).to eq(%w[ingredient1 ingredient2])
      expect(menuitem.drink).to eq(false)
    end
  end

  describe '#==' do
    it 'returns true when compared with a MenuItem object with equivalent attributes' do
      expect(menuitem.==(MenuItem.new('meal1', 13.0, %w[ingredient1 ingredient2], false))).to eq(true)
    end
    it 'returns false when compared with a MenuItem object with non-equivalent attributes' do
      expect(menuitem.==(MenuItem.new('meal1', 13.0, %w[ingredient1 ingredient2], true))).to eq(false)
      expect(menuitem.==(MenuItem.new('meal1', 13.0, %w[ingredient1 ingredientX], false))).to eq(false)
      expect(menuitem.==(MenuItem.new('meal1', 14.0, %w[ingredient1 ingredient2], false))).to eq(false)
      expect(menuitem.==(MenuItem.new('mealX', 13.0, %w[ingredient1 ingredient2], false))).to eq(false)
    end
    it 'returns false when comapred to a non MenuItem object' do
      expect(menuitem.==('menuitem')).to eq(false)
    end
  end

  describe '#to_h' do
    it 'returns a hash' do
      expect(menuitem.to_h).to be_an_instance_of Hash
    end
    it 'assigns key values in name, price, ingredients, format' do
      expect(menuitem.to_h).to eq({ name: 'meal1', price: 13.0, ingredients: %w[ingredient1 ingredient2],
                                    drink: false })
    end
  end

  describe '#add_ingredients' do
    it 'appends an array of ingredients to the ingredients array' do
      menuitem.add_ingredients(%w[ingredient3 ingredient4])
      expect(menuitem.ingredients).to eq(%w[ingredient1 ingredient2 ingredient3 ingredient4])
    end
  end

  describe '#remove_ingredient' do
    it 'deletes a specific ingredient from a MenuItems ingredients array' do
      menuitem.remove_ingredient('ingredient1')
      expect(menuitem.ingredients).to eq(['ingredient2'])
    end
  end

  describe '#change_name' do
    it 'changes the name of the MenuItem to a new_name' do
      menuitem.change_name('new_name')
      expect(menuitem.name).to eq('new_name')
    end
  end

  describe '#change_price' do
    it 'changes the price of the menuitem to a new price' do
      menuitem.change_price(1.0)
      expect(menuitem.price).to eq(1.0)
    end
  end
end
