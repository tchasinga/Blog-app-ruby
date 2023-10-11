require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom') }

  before { subject.save }

  it 'User should not be valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'User should have a name' do
    expect(subject.name).to be_present
  end

  it 'Post Counter attribute should be greater or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'user name should not be more than 250 characters' do
    subject.name = Faker::Lorem.characters(number: 251)
    expect(subject).to_not be_valid
  end
end
