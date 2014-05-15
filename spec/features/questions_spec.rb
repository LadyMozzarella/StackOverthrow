require 'spec_helper'

describe 'Questions', :js => true do

  describe "User can login and ask a question" do
    it "by signing up and filling out the form" do
      visit new_user_path
      fill_in "Username", :with => "Darren"
      fill_in "Password", :with => "password"
      fill_in "Password confirmation", :with => "password"
      click_on "Create User"
      fill_in "Title", :with => "I have a question..."
      fill_in "Text", :with => "Eh, nevermind"
      click_on "Ask"
      expect(page).to have_content("I have a question...")
    end
  end
end