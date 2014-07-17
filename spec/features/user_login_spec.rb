require 'rails_helper'

feature "Sign up as User" do
  scenario "visit sign-up page" do
    visit new_session_path

    expect(page).to have_css '.sign-up', 'Sign up'
  end
end
