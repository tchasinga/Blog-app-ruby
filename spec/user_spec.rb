require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { described_class.new(name: 'John', posts_counter: 5) }

  it 'name must not be blank.' do
    user = User.new(name: nil)
    expect(user).not_to be_valid
  end

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).not_to be_valid
  end

  it 'is not valid with a negative posts_counter' do
    user.posts_counter = -1
    expect(user).not_to be_valid
  end

  it 'is valid with a posts_counter of zero' do
    user.posts_counter = 0
    expect(user).to be_valid
  end
end
