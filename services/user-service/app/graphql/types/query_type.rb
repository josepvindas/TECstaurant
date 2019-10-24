module Types
  class QueryType < BaseObject
    # queries are just represented as fields
    field :all_users, [UserType], null: false

    # this method is invoked, when `all_users` fields is being resolved
    def all_users
      User.all
    end
  end
end
