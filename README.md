# CozySmoke Smoke Tests

A (very!) minimal smoke test suite for the Cozy.co web app and marketing site.

Smoke tests are RSpec and make use of [Watir WebDriver](http://watirwebdriver.com/) via the [watir-rspec](https://github.com/watir/watir-rspec) gem.

### Dependencies

**OSX or Linux Desktop**: Firefox

**Linux Server**: need a headless browser and JS driver, also an xserver. [Capybara-webkit](https://github.com/thoughtbot/capybara-webkit) + Xvfb + [Headless](https://github.com/leonid-shevtsov/headless) seems to be a common setup.

### Usage

1. Install gems with bundler: `bundle install`
2. Modify `config/config.yml` as needed
3. Run all tests with `rake`

Test output will be on STDOUT and also available in HTML format at `tmp/spec-results/index.html`

This suite could easily be run with Jenkins on a scheduled basis, or even made into Sensu checks.
