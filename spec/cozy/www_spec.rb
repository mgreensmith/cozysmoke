require 'spec_helper'

describe 'Marketing site at www.cozy.co' do
  before :all do
    goto 'http://www.cozy.co'
  end

  it 'redirects to https and lands on /for-landlords' do
    url.should == 'https://www.cozy.co/for-landlords/'
  end

  it 'title contains text "collect rent online"' do
    title.should include 'collect rent online'
  end

  it 'page content contains text "Start collecting rent online"' do
    text.should include 'Start collecting rent online'
  end

end
