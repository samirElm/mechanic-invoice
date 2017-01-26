require 'rails_helper'

describe Users::CustomersController do

  before(:each) do
    @user = FactoryGirl.build(:user)
    sign_in @user
    allow(controller).to receive(:current_user).and_return(@user)
  end

  it "should have a current_user" do
    expect(subject.current_user).to_not eq(nil)
  end

  describe "GET #index" do
    it "populates an array of customers"
    it "renders the :index view"
  end

  describe "GET #show" do
    it "assigns the requested customer to @customer"
    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new customer to @customer"
    it "renders the :new template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new customer in the database"
      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "does not save the new customer in the database"
      it "re-renders the :new template"
    end
  end
end