require 'rails_helper'

RSpec.describe Comment, type: :model do
  @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Comment.new(text: 'hello man') }

  before { subject.save }

  it 'comments should be not be Valid' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
end
