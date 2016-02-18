require File.expand_path('../../spec_helper', __FILE__)
require 'atg_app_center_catalog_page'
require 'atg_login_register_page'
require 'atg_my_profile_page'

=begin
Verify that user can login successfully
=end

# initial variables
atg_app_center_catalog_page = AtgAppCenterCatalogPage.new
atg_login_page = nil
atg_my_profile_page = nil

# account information
username = AppCenterAccount::LEAPFROG_ACC[0]
password = AppCenterAccount::LEAPFROG_ACC[1]

feature 'TC02 - Login to ATG server', js: true do
  context 'Go to LeapFrog login page' do
    scenario "1. Go to LF.com page (URL: #{URL::ATG_APP_CENTER_URL})" do
      atg_app_center_catalog_page.load
    end

    scenario 'Verify \'Log In / Register\' link displays on Top navigate bar' do
      expect(atg_app_center_catalog_page.login_register_text).to eq('Log In / Register')
    end

    scenario 'Click to \'Log In / Register\' link to go to Login page' do
      atg_login_page = atg_app_center_catalog_page.goto_login
    end

    scenario "Verify 'Create a LeapFrog Account' button displays" do
      expect(atg_login_page.create_account_h2.text).to eq('Create a LeapFrog Account')
    end

    scenario "Verify 'Log In' button displays" do
      expect(atg_login_page.log_in_h2.text).to eq('Log In')
    end
  end

  context 'Login with an existing account' do
    scenario "Login with an existing account: #{username} / #{password}" do
      atg_my_profile_page = atg_login_page.login(username, password)
    end

    scenario "Verify 'My Account' link displays" do
      expect(atg_my_profile_page.login_register_text).to eq('My Account')
    end

    scenario "Verify 'My Profile' page displays" do
      expect(atg_my_profile_page.my_profile_page_exist?).to eq(true)
    end
  end

  after :all do
    atg_my_profile_page.logout
  end
end
