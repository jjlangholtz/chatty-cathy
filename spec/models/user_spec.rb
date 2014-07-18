require 'spec_helper'

describe User, '#name' do
  it "returns the concatenated first and last name" do
    user = build(:user, first_name: 'josh', last_name: 'langholtz')

    expect(user.name).to eq 'Josh Langholtz'
  end
end
