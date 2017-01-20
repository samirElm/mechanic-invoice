FactoryGirl.define do
  factory :customer do |c|
    c.first_name "John"
    c.last_name  "Doe"
    c.immat      "AB-123-CD"
    c.phone      "0123456789"
    c.address    "12 rue de Dunkerque, Paris"
    association  :user
  end
end