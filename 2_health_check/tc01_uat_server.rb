require File.expand_path('../../spec_helper', __FILE__)
require 'atg_app_center_catalog_page'

=begin
Verify that ATG site is up
=end

# initial variables
atg_app_center_catalog_page = AtgAppCenterCatalogPage.new

feature 'TC01 - Health check for ATG server', js: true do
  context 'Health check for ATG server' do
    scenario "1. Go to LF.com page (URL: #{URL::ATG_APP_CENTER_URL})" do
      atg_app_center_catalog_page.load
    end

    scenario '2. Verify LeapFrog Logo displays' do
      expect(atg_app_center_catalog_page.leapfrog_logo['alt']).to eq('LeapFrog Logo')
      expect(atg_app_center_catalog_page.leapfrog_logo['src']).to eq('http://s7.leapfrog.com/is/image/LeapFrog/cq_lf_logo?$cq-png-alpha-no-resize$&hei=60')
    end

    scenario "3. Verify 'Log In / Register' link displays on Top navigate bar" do
      expect(atg_app_center_catalog_page.login_register_text).to eq('Log In / Register')
    end
  end
end
