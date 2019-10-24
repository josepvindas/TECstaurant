module Types
    class UserType < BaseObject
      field :id, ID, null: false
      field :firstname, String, null: false
      field :lastname, String, null: false
      field :email, String, null: false
      field :username, String, null: false
      field :usertypeid, Int, null: false
    end
  end