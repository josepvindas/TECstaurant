module Mutations
    class CreateRestaurant < BaseMutation
      argument :name, String, required: true
      argument :description, String, required: true
      argument :tags, String, required: true
  
      type Types::RestaurantType
  
      def resolve(name: nil, description: nil, tags: nil)
        Restaurant.create!(
          name: name,
          description: description,
          tags: tags,
          ownerid: context[:current_user][:id]
        )
      end
    end
  end