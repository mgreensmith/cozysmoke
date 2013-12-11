require 'spec_helper'

describe 'Marketing site at www.cozy.co, with optimizely disabled' do
  before :all do
    begin
      goto 'http://www.cozy.co/?optimizely_opt_out=true'
    rescue Selenium::WebDriver::Error::UnhandledAlertError
      # Apparently it's impossible to gracefully handle an alert triggered onload?
      # Also big thanks to optimizely for forcing a JS alert is you opt out... /s
    end
  end

  it 'redirects to https and lands on the root URI' do
    url.should =~ %r{https://www.cozy.co/}
  end

  it 'title contains text "collect rent online"' do
    title.should include 'collect rent online'
  end

  it 'page content contains text "Collect rent online"' do
    text.should include 'Collect rent online'
  end

end
