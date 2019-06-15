FactoryBot.define do
  factory :worker do
    name { Faker::Name.name }
    company_name { 'Hatchways' }
    email { Faker::Internet.email }
  end
end
