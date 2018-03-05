require 'rails_helper'
feature 'User features' do
  before do
    @user = create(:user)
  end
  feature "user sign-up" do
    before(:each) do
      visit "/users/new"
    end
    scenario "visits sign-up page" do
      expect(page).to have_field('user[name]')
      expect(page).to have_field('user[email]')
      expect(page).to have_field('user[password]')
      expect(page).to have_field('user[password_confirmation]')
    end
    scenario "with improper inputs redirect back to sign-up page" do
      click_button "Signup"
      expect(current_path).to eq('/')
      expect(page).to have_text("can't be blank")
    end
    scenario "with proper inputs, create new user and redirect to user show page" do
      fill_in 'email', with:"william@email.com"
      fill_in 'name', with:"william palmer"
      fill_in 'password', with:"william"
      fill_in 'password_confirmation', with:"william"
      click_button 'Signup'
      expect(current_path).to eq('session/new')
    end
  end
  feature "user dashboard" do
    before do
      log_in
    end
    scenario "display user information" do
      expect(page).to have_text("#{@user.name}")
      expect(page).to have_link("Edit Profile")
    end
  end
end
