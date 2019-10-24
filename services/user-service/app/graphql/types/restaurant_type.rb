module Types
    class RestaurantType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :description, String, null: false
      field :tags, String, null: false
      field :ownerid, Int, null: false
    end
  end