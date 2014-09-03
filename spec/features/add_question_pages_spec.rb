require 'rails_helper'




describe 'Adding a question' do
  let(:user) { FactoryGirl.create(:user) }
  before(:each) do
    user_login
  end

  it 'visits the question creation page' do
    click_link "q?      (҂⌣̀_⌣́)ᕤ"
    expect(page).to have_content 'Add a question'
  end

  it 'adds a question' do
    click_link "q?      (҂⌣̀_⌣́)ᕤ"
    fill_in 'question_text', :with => "Blah Blah"
    click_button "submit"
    expect(page).to have_content 'Blah Blah'
  end

  it 'displays an error if text box is blank on submission' do
    click_link "q?      (҂⌣̀_⌣́)ᕤ"
    click_button "submit"
    expect(page).to have_content "Please fill in the text box"
  end
end

