require 'rails_helper'

RSpec.describe User, type: :model do
  context "With valid attributes" do
    it "should save" do
      expect(build(:user)).to be_valid
    end
    it "automatically encrypts the password into the password_digest attribute" do
      expect(build(:user).password_digest.present?).to eq(true)
    end
    it "email as lowercase" do
      expect(create(:user, email: 'EMAIL@GMAIL.COM').email).to eq('email@gmail.com')
    end
  end

  context "With invalid attributes sholud not save" do
    it "name is blank" do
      expect(build(:user, name:'')).to be_invalid
    end
    it "email is blank" do
      expect(build(:user, email:'')).to be_invalid
    end
    it "email format is wrong" do
      emails = %w[@user@example.com]
      emails.each do |email|
        expect(build(:user, email:email)).to be_invalid
      end
    end
    it "email is not unique" do
      create(:user)
      expect(build(:user)).to be_invalid
    end
    it 'password blank' do
      expect(build(:user, password:'')).to be_invalid
    end
    it "password doesn't make confirm_password" do
      expect(build(:user, password_confirmation:'notpassword')).to be_invalid
    end
  end
end
