require 'rails_helper'

describe 'Viewing a user' do
  let(:user) { FactoryGirl.create(:user) }
  it "signs a user in who uses the right password" do
    visit '/sessions/new'
    fill_in 'name', :with => 'test'
    fill_in 'password', :with => 'password'
    within("form") do
      click_button 'login'
    end
    expect(page).to have_content 'Logged in'
  end

  it "signs a user in who uses the right password" do
    visit '/sessions/new'
    fill_in 'name', :with => 'test'
    fill_in 'password', :with => 'test'
    within("form") do
      click_button 'login'
    end
    expect(page).to have_content 'Name or password is invalid'
  end
end
