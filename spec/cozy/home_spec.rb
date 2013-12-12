require 'spec_helper'

describe 'Cozy app at home.cozy.co' do
  before :all do
    goto 'http://home.cozy.co'
  end

  it 'redirects to https and lands on root URI' do
    url.should be_cozy_url_for(:root)
  end

  it 'page content contains text "Welcome, please sign in to Cozy"' do
    text.should include 'Welcome, please sign in to Cozy.'
  end

  it 'rejects a sign in attempt with invalid credentials' do
    text_field(name: 'email').set 'nonexistant@email.com'
    text_field(name: 'password').set 'justafakepassword'
    form(action: '/signin').submit
    url.should be_cozy_url_for(:root)
  end

  it 'can sign in with a valid landlord account' do
    text_field(name: 'email').set @config[:landlord_email]
    text_field(name: 'password').set @config[:landlord_password]
    form(action: '/signin').submit
    url.should be_cozy_url_for(:dashboard) || be_cozy_url_for(:property_admin)
  end

  it 'page content contains text "ADD A PROPERTY"' do
    text.should include 'ADD A PROPERTY'
  end
end
