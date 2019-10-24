module Mutations
    class SignInUser < BaseMutation
      null true
  
      argument :username, Types::AuthProviderUsernameInput, required: false
  
      field :token, String, null: true
      field :user, Types::UserType, null: true
  
      def resolve(username: nil)
        # basic validation
        return unless username
  
        user = User.find_by username: username[:username]
  
        # ensures we have the correct user
        return unless user
        return unless user.authenticate(username[:password])
  
        # use Ruby on Rails - ActiveSupport::MessageEncryptor, to build a token
        crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
        token = crypt.encrypt_and_sign("user-id:#{ user.id }")

        context[:session][:token] = token
  
        { user: user, token: token }
      end
    end
  end