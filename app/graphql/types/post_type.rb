module Types
  class PostType < Types::BaseObject
    field :id,           ID,       null: false
    field :title,        String,   null: false
    field :slug,         String,   null: false
    field :excerpt,      String,   null: false
    field :content,      String,   null: false
    field :published,    Boolean,  null: false
    field :published_at, GraphQL::Types::ISO8601DateTime, null: true
    field :author,       Types::AuthorType,    null: false
    field :comments,     [Types::CommentType], null: false

    def author
      dataloader.with(Sources::RecordById, Author).load(object.author_id)
    end

    def comments
      dataloader.with(Sources::RecordsByForeignKey, Comment, :post_id).load(object.id)
    end
  end
end
