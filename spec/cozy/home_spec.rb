require "spec_helper"

describe "Cozy app at home.cozy.co" do
  before :all do
    goto "http://home.cozy.co"
  end

  it "redirects to https and lands on signin page" do
    url.should == 'https://home.cozy.co/'
  end

  it 'page content contains text "Welcome, please sign in to Cozy"' do
    text.should include 'Welcome, please sign in to Cozy.'
  end

  it 'can sign in as Matt Greensmith landlord account' do
    text_field(:name => "email").set "matt.greensmith+cozylandlord@gmail.com"
    text_field(:name => "password").set "cozylandlordpassword"
    form(:action => '/signin').submit
    url.should =~ /https:\/\/home.cozy.co\/[a-z0-9]{8}/
  end

  it 'page content contains text "ADD A PROPERTY"' do
    text.should include 'ADD A PROPERTY'
  end
end