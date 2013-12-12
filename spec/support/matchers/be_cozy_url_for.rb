RSpec::Matchers.define :be_cozy_url_for do |expected_pattern|

  patterns = { root: nil,
               dashboard: 'dashboard',
               property_admin: '[:alnum:]{8}',
             }

  match do |actual_url|
    actual_url =~ %r{https://home.cozy.co/#{patterns[expected_pattern]}}
  end
end
