module Mutations
    class UpdateUser < BaseMutation
      # often we will need input types for specific mutation
      # in those cases we can define those input types in the mutation class itself
      argument :id, Integer, required: true
      argument :firstname, String, required: true
      argument :lastname, String, required: true
      argument :email, String, required: true
      argument :username, String, required: true
  
      type Types::UserType
  
      def resolve(id: nil, **attributes)
        User.find(id).tap do |user|
            user.update!(attributes)
        end
      end
    end
  end