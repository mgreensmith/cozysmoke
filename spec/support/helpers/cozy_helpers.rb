module Cozy
  module Helpers
    def log_in(email, password)
      text_field(name: 'email').set email
      text_field(name: 'password').set password
      form(action: '/signin').submit
    end

    def log_in_as_landlord
      log_in(@config[:landlord_email], @config[:landlord_password])
    end
  end
end
