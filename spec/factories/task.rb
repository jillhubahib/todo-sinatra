FactoryBot.define do
  factory :task do
    name { Faker::Verb.base }
    user
  end
end
