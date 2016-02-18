require File.expand_path('../../spec_helper', __FILE__)
require 'csc_login_page'

=begin
Verify that CSC site is up
=end

# initial variables
csc_login_page = CSCLoginPage.new

feature "TC03 - Health check for CSC server: #{URL::CSC_CONST}", js: true do
  scenario '1. Go to CSC page' do
    csc_login_page.load
  end

  scenario '2. Verify Username field displays' do
    expect(csc_login_page.username_label.text).to eq('Username:')
  end

  scenario '3. Verify Username field displays' do
    expect(csc_login_page.password_label.text).to eq('Password:')
  end
end
