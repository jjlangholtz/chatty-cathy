require 'rails_helper'

feature "Sign up as User" do
  before :each do
    visit new_session_path
  end

  scenario "visit sign-up page" do
    expect(page).to have_css '.sign-up', 'Sign up'
  end

  scenario "click 'Sign in with Twitter'" do
  end
end
