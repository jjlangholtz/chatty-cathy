require 'spec_helper'

feature "Sign up as User" do
  before :each do
    visit new_session_path
  end

  scenario "visit sign-up page" do
    expect(page).to have_css '.button', 'Sign up with Twitter'
  end

  scenario "click 'Sign up with Twitter'" do
    click_link 'Sign up with Twitter'
  end
end
