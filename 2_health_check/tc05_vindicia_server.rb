require File.expand_path('../../spec_helper', __FILE__)
require 'vin_login_page'

=begin
Verify that Vindicia server is up
=end

# initial variables
vin_login_page = VinLoginPage.new

feature "TC05 - Health check for Vindicia server (#{URL::VIN_CONST})", js: true do
  scenario '1. Go to Vindicia page' do
    vin_login_page.load
  end

  scenario '2. Verify Login field displays' do
    expect(vin_login_page.login_label.text).to eq('Login')
  end

  scenario '3. Verify Password field displays' do
    expect(vin_login_page.password_label.text).to eq('Password')
  end
end
