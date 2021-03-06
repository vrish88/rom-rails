require 'spec_helper'

describe 'User model mapping' do
  let(:rom) { ROM.env }

  let(:users) { rom.relation(:users).as(:entity) }

  before do
    rom.relations.users.insert(name: 'Piotr', email: 'piotr@test.com')
  end

  it 'works' do
    piotr = User.new(id: 1, name: 'Piotr', email: 'piotr@test.com')

    expect(users.by_name('Piotr').to_a).to eql([piotr])
  end
end
