require File.expand_path('../../spec_helper', __FILE__)
require 'vin_login_page'
require 'vin_home_page'

=begin
Verify that Vindicia server is up and user login successfully
=end

# initial variables
vin_login_page = VinLoginPage.new
vin_home_page = VinHomePage.new

feature "TC06 - Health check for log in to Vindicia server (#{URL::VIN_CONST})", js: true do
  before :all do
    vin_login_page.load
  end

  scenario "1. Login to vindicia sever with account: #{Account::VIN_USERNAME_CONST} / #{Account::VIN_PASSWORD_CONST}" do
    vin_login_page.login(Account::VIN_USERNAME_CONST, Account::VIN_PASSWORD_CONST)
  end

  scenario "2. Verify 'CONTACT US | LOGOUT' link displays on Top navigate bar" do
    skip 'Check configured password under ATG->Config ATG->Vindicia' if vin_login_page.has_login_error_msg?(wait: TimeOut::WAIT_MID_CONST)
    expect("#{vin_home_page.contact_us_link.text} | #{vin_home_page.log_out_link.text}").to eq('CONTACT US | LOGOUT')
  end
end
