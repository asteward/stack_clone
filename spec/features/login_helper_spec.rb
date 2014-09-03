def user_login
    visit '/sessions/new'
    fill_in 'name', :with => 'test'
    fill_in 'password', :with => 'password'
    within("form") do
      click_button 'login'
    end
end
