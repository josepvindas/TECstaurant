module Mutations
    class DeleteUser < BaseMutation
      # often we will need input types for specific mutation
      # in those cases we can define those input types in the mutation class itself
      argument :id, Integer, required: true
      
      type Types::UserType
  
      def resolve(id: nil)
        User.find(id).destroy
      end
    end
  end