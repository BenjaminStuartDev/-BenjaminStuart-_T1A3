# frozen_string_literal: true

describe Table do
  let(:table) { Table.new(1, []) }

  it 'can be instantiated' do
    expect(table).not_to be_nil
    expect(table).to be_an_instance_of Table
  end

  describe '#initialise' do
    it 'initialises Table with table_num [Integer] and orders [Array]' do
      expect(table.table_num).to eq(1)
      expect(table.orders).to eq([])
    end
  end

  describe '#to_h' do
    it 'returns a hash' do
      expect(table.to_h).to be_an_instance_of Hash
    end
    it 'assigns key values in name, price, ingredients, format' do
      expect(table.to_h).to eq({ table_num: 1, orders: [] })
    end
  end
end
