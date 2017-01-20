FactoryGirl.define do
  factory :user do |user|
    user.first_name 'John'
    user.last_name  'Doe'
    user.email      'john@doe.com'
    user.password   'password'

    factory :user_with_customers do
      after(:create) do |user|
        create(:customer, user: user)
      end
    end
  end
end