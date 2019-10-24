module Mutations
    class CreateUser < BaseMutation
      # often we will need input types for specific mutation
      # in those cases we can define those input types in the mutation class itself
      class AuthProviderSignupData < Types::BaseInputObject
        argument :username, Types::AuthProviderUsernameInput, required: false
      end
  
      argument :firstname, String, required: true
      argument :lastname, String, required: true
      argument :email, String, required: true
      argument :usertypeid, Int, required: true
      argument :auth_provider, AuthProviderSignupData, required: false
  
      type Types::UserType
  
      def resolve(firstname: nil, lastname: nil, email: nil, usertypeid: nil, auth_provider: nil)
        User.create!(
          firstname: firstname,
          lastname: lastname,
          email: email,
          usertypeid: usertypeid,
          username: auth_provider&.[](:username)&.[](:username),
          password: auth_provider&.[](:username)&.[](:password)
        )
      end
    end
  end