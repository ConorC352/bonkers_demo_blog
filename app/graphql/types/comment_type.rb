module Types
  class CommentType < Types::BaseObject
    field :id,          ID,     null: false
    field :body,        String, null: false
    field :author_name, String, null: false
    field :created_at,  GraphQL::Types::ISO8601DateTime, null: false
  end
end
