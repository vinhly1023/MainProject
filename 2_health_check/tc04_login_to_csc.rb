require File.expand_path('../../spec_helper', __FILE__)
require 'csc_login_page'

=begin
Verify that CSC site is up and user login successfully
=end

# initial variables
csc_login_page = CSCLoginPage.new
csc_home_page = nil

feature "TC04 - Health check for Login to CSC server: #{URL::CSC_CONST}", js: true do
  before :all do
    csc_login_page.load
  end

  scenario "1. Login to CSC server with account: #{Account::CSC_USERNAME_CONST} / #{Account::CSC_PASSWORD_CONST}" do
    csc_home_page = csc_login_page.login(Account::CSC_USERNAME_CONST, Account::CSC_PASSWORD_CONST)
  end

  scenario '2. Verify Order Search section displays' do
    expect(csc_home_page.order_search_string.text).to eq('Order Search')
  end

  scenario '3. Verify Order Summary section displays' do
    expect(csc_home_page.order_summanry_string.text).to eq('Order Summary')
  end
end
