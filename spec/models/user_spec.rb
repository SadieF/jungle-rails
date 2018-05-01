require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(first_name: "Marcy",
                        last_name: "Pigeon",
                        email: "marcy_pigeon@gmail.com",
                        password: "password",
                        password_confirmation: "password"
                        )
     end

    describe "Validations" do
      it "should match password_confirmation with password_digest" do
        @user.password = "password"
        @user.password_confirmation = "password123"
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "should have a password" do
        @user.password_digest = nil
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "should have a unique email" do
        @user = User.create(first_name: "Simon",
                        last_name: "Pigeon",
                        email: "MARCY_pigeon@gmail.com",
                        password_digest: "password",
                        password_confirmation: "password"
                        )
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include "Email has already been taken"
      end
      it "should have an email" do
        @user.email = nil
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "should have a first_name" do
        @user.first_name = nil
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it "should have a last_name" do
        @user.last_name = nil
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it "should have a minimum password length of 3" do
        @user.password_digest = "wr"
        expect(@user).not_to be_valid
        expect(@user.errors.full_messages).to include "Password digest is too short (minimum is 3 characters)"
      end

    end

    describe '.authenticate_with_credentials' do
      it "should verify a users credentials and return a new user" do
        @user_auth = @user.authenticate_with_credentials("", "")
        expect(@user_auth).not_to be_valid
        expect(@user_auth.errors.full_messages).to include "Password can't be blank", "Password can't be blank", "Password digest can't be blank", "Password digest is too short (minimum is 3 characters)"
      end

      it "should verify an email when user types spaces before or after" do
        @user_auth = @user.authenticate_with_credentials("    marcy_pigeon@gmail.com", "password")
        expect(@user_auth).to_not be_valid
        expect(@user_auth.errors.full_messages).to include "Email has already been taken"
      end

      it "should verify an email when a user types in capitals" do
        @user_auth = @user.authenticate_with_credentials("MARCY_pigeon@gmail.com", "password")
        expect(@user_auth).to_not be_valid
        expect(@user_auth.errors.full_messages).to include "Email has already been taken"
      end


  end

end
