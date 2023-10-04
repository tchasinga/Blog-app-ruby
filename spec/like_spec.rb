require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it 'belongs to a post' do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq(:belongs_to)
    end
  end

  describe 'callbacks' do
    describe 'after_save' do
      let(:user) { User.create(name: 'Sigh') }
      let(:post) { Post.create(title: 'Test Post') }
    end
  end
end
