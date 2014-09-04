require 'rails_helper'
    Capybara.default_wait_time = 5

describe 'vote on an answer' do
  let(:user) { FactoryGirl.create(:user)}
  before(:each) do
    user_login
  end

  it 'adds a vote to an answer' do
    test_question = Question.create({:user_id => user.id, :text => "test text" })
    test_answer = test_question.answers.create({:user_id => user.id, :text => "hey" })
    visit '/'

    click_link "#{test_question.id}"
    click_link "#{test_answer.id}"
    print page.html

    expect(page).to have_content "Vote | 1"

  end
end
