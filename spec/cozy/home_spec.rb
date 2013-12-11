require 'spec_helper'

describe 'Cozy app at home.cozy.co' do
  before :all do
    goto 'http://home.cozy.co'
  end

  it 'redirects to https and lands on signin page' do
    url.should == 'https://home.cozy.co/'
  end

  it 'page content contains text "Welcome, please sign in to Cozy"' do
    text.should include 'Welcome, please sign in to Cozy.'
  end

  it 'can sign in with a valid landlord account' do
    text_field(name: 'email').set @config[:landlord_email]
    text_field(name: 'password').set @config[:landlord_password]
    form(action: '/signin').submit
    # a URI ending in an 8-digit alnum string implies a successful sign in
    # and that the 'new property' page has autoloaded
    # A URI of /dashboard is also valid, so we'll accept 8 or 9 chars
    url.should =~ %r{https://home.cozy.co/[a-z0-9]{8,9}}
  end

  it 'page content contains text "ADD A PROPERTY"' do
    text.should include 'ADD A PROPERTY'
  end
end
