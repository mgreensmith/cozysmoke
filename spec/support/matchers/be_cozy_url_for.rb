RSpec::Matchers.define :be_cozy_url_for do |expected_pattern|

  patterns = { root: '',
               dashboard: '/dashboard',
               property_admin: '/[:alnum:]{8}',
             }
  maybe_querystring = '((/\?\S+)|/?$)' # accepts querystring or end of URL with optional /

  match do |actual_url|
    actual_url =~ %r{https://home.cozy.co#{patterns[expected_pattern]}#{maybe_querystring}}
  end
end
