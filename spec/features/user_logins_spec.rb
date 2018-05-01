require 'rails_helper'

RSpec.feature "Visitor can login", type: :feature, js: true do

  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'First',
      last_name: 'Last',
      email: 'first@user.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  scenario "They enter their login details" do
    # ACT
    visit '/login'

    within 'form' do
      fill_in id: 'email', with: 'first@user.com'
      fill_in id: 'password', with: '123456'

      click_button 'Submit'
    end

    sleep 5

    save_screenshot

    expect(page).to have_text 'Logout'
  end

end