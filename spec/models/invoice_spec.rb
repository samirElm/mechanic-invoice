require 'rails_helper'

describe Invoice do
  it "is invalid without a customer" do
    FactoryGirl.build(:invoice, customer_id: nil).should_not be_valid
  end
  it "is invalid without a description_mo" do
    FactoryGirl.build(:invoice, description_mo: nil).should_not be_valid
  end
  it "is invalid without a time_mo" do
    FactoryGirl.build(:invoice, time_mo: nil).should_not be_valid
  end
end