FactoryBot.define do
  factory :user do
    name { 'Test' }
    posts_counter { 0 }
  end

  factory :post do
    title { 'Title' }
    text { 'Sample' }
    commentsCounter { 2 }
    likesCounter { 0 }
    association :author, factory: :user
  end

  factory :comment do
    text { 'Sample Comment' }
    association :user, factory: :user
    association :post, factory: :post
  end

  factory :like do
    association :user, factory: :user
    association :post, factory: :post
  end
end
