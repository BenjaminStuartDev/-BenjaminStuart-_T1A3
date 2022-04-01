# frozen_string_literal: true

require './staff'

describe Staff do
  let(:staff) { Staff.new('Name', 'Password', false) }

  it 'can be instantiated' do
    expect(staff).not_to be_nil
    expect(staff).to be_an_instance_of Staff
  end

  describe '#initialise' do
    it 'initialises Staff with name [String], password [String] and manager role [Boolean]' do
      expect(staff.name).to eq('Name')
      expect(staff.password).to eq('Password')
      expect(staff.manager).to eq(false)
    end
  end

  describe '#==' do
    it 'returns true when compared with a Staff object with equivalent attributes' do
      expect(staff.==(Staff.new('Name', 'Password', false))).to eq(true)
    end
    it 'returns false when compared with a Staff object with non-equivalent attributes' do
      expect(staff.==(Staff.new('NameX', 'Password', false))).to eq(false)
      expect(staff.==(Staff.new('Name', 'PasswordX', false))).to eq(false)
      expect(staff.==(Staff.new('Name', 'Password', true))).to eq(false)
    end
    it 'returns false when comapred to a non MenuItem object' do
      expect(staff.==('staff')).to eq(false)
    end
  end

  describe '#to_h' do
    it 'returns a hash' do
      expect(staff.to_h).to be_an_instance_of Hash
    end
    it 'assigns key values in name, password and manager format' do
      expect(staff.to_h).to eq({ name: 'Name', password: 'Password', manager: false })
    end
  end

  describe '#change_name' do
    it 'changes the name of the Staff object to a new_name' do
      staff.change_name('new_name')
      expect(staff.name).to eq('new_name')
    end
  end

  describe '#make_manager' do
    it 'sets the manager attribute of the staff object to true' do
      staff.make_manager
      expect(staff.manager).to eq(true)
    end
  end

  describe '#remove_manager' do
    it 'sets the manager attribute of the staff object to true' do
      staff_manager = Staff.new('Name', 'Password', true)
      staff_manager.remove_manager
      expect(staff_manager.manager).to eq(false)
    end
  end

  describe '#change_password' do
    it 'changes the password attribute of the staff object to new_password' do
      staff.change_password('new_password')
      expect(staff.password).to eq('new_password')
    end
  end
end
