# frozen_string_literal: true

require './interface'

describe Interface do
  let(:interface) { Interface.new }

  it 'can be instantiated' do
    expect(interface).not_to be_nil
    expect(interface).to be_an_instance_of Interface
  end
end
