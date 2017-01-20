FactoryGirl.define do
  factory :invoice do
    association :customer
    time_mo 1.0
    description_mo "Remplacement plaquettes avant"
  end
end