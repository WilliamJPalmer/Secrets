require 'rails_helper'
feature 'authentication' do
  before do
    @user = create(:user)
  end
  feature "user sign_in" do
    scenario "visits sign-in page" do
      # visit '/sessions/new'
      visit ''
      expect(page).to have_field('email')
      expect(page).to have_field('password')
    end
    scenario 'logs in user if email/password combination is valid' do
      log_in
      # expect(current_path).to eq("/users/#{@user.id}")
      expect(current_path).to eq("/")
      # expect(page).to have_text(@user.name)
    end
    scenario "does not sign in if email not found" do
      log_in email:"wrong email"
      expect(current_path).to eq('/')
      expect(page).to have_text("Invalid Combination")
    end
    scenario "does not sign in use if email/password combination is invalid" do
      log_in password: 'wrong password'
      expect(current_path).to eq("/")
      expect(page).to have_text('Invalid Combination')
    end
  end
  feature "user to log out" do
    before do
      log_in
    end
    scenario 'displays "Logout" button when user is logged on' do
      expect(page).to have_button('Logout')
    end
    scenario"logs out user and redirects to login page" do
      click_button 'Logout'
      expect(current_path).to eq('/')
    end
  end
end
