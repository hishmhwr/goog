class User < ActiveRecord::Base
        def self.sign_in_from_omniauth(auth)
          find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
      end
      def self.create_user_from_omniauth(auth)
      create(
          provider: auth['provider'],
          uid: auth['uid'],
          name: auth['info']['name']
            )
        
      end
  has_secure_password
  validate :password_complexity

def password_complexity
 return if password.nil?

 if password.size < 8
   errors.add :password, "Must be at least 8 characters long."
   return
 end

 required_complexity = 3 # we're actually storing this in the configuration of each customer

 if !CheckPasswordComplexityService.new(password, required_complexity).valid?
   errors.add :password, "Your password does not match the security requirements."
 end
end
end
