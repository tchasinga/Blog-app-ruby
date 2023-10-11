require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'methods' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post) }
    let(:like) { Like.new(author: user, post:) }
  end
end
