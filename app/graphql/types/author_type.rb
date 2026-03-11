module Types
  class AuthorType < Types::BaseObject
    field :id,    ID,     null: false
    field :name,  String, null: false
    field :email, String, null: false
    field :posts, [Types::PostType], null: false

    def posts
      dataloader.with(Sources::RecordsByForeignKey, Post, :author_id).load(object.id)
    end
  end
end
