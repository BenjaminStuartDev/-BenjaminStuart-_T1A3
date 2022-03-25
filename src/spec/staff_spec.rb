# frozen_string_literal: true
require './staff'
require './staff'

describe Staff do
  let(:staff) { Staff.new('John', 'Password') }

  it 'can be instantiated' do
    expect(staff).not_to be_nil
    expect(staff).to be_an_instance_of Staff
  end
end
