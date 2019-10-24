module Types
    class AuthProviderUsernameInput < BaseInputObject
      # the name is usually inferred by class name but can be overwritten
      graphql_name 'AUTH_PROVIDER_USERNAME'
  
      argument :username, String, required: true
      argument :password, String, required: true
    end
  end