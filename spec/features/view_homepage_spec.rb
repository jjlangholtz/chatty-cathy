require 'spec_helper'

feature "User visits home page" do
  scenario "they see the title of the page" do
    visit root_path

    expect(page).to have_title 'Chatty Cathy'
  end
end
