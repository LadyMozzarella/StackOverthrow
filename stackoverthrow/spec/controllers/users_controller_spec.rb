 require 'spec_helper'

describe UsersController do
  describe '#show' do
    it "should show user profile"
  end

  describe '#new' do
    context 'logged in' do
      it "should redirect the user to their profile"
    end
    context 'not logged in' do
      it "should show a new user form"
    end
  end

  context '#create' do
    it "should add a new user to the database"
  end

  describe '#edit' do
    context "user is logged in" do
      it "should show an edit form"
    end

    context 'user is not logged in' do
      it "should redirect to login page"
    end
  end

  describe '#update' do
    it "should update a user details"
  end
end