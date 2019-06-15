FactoryBot.define do
  factory :work_order do
    title { 'Test title' }
    description { 'Test description' }
    deadline { '01/01/2020' }
  end
end
