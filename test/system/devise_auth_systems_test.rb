require "application_system_test_case"

class DeviseAuthSystemsTest < ApplicationSystemTestCase
  def setup
    @user = users(:one)
  end

  test 'sign in existing user' do
    visit root_path
    @user.confirm
    sign_in @user
    visit root_path
    assert_current_path root_path 
    sign_out :@user
  end

  test 'create user and sign in' do
    email = Faker::Internet.email
    password = Faker::Internet.password(min_length: 6, max_length: 10)
    @user = User.create(email: email, password: password)
    @user.confirm
    visit root_path
    sign_in @user
    click_button 'Log in'
    assert_current_path root_path
  end
end
