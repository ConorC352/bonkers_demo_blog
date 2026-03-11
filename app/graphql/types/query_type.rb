module Types
  class QueryType < Types::BaseObject
    field :posts, [Types::PostType], null: false do
      argument :published, Boolean, required: false
    end

    field :post, Types::PostType, null: true do
      argument :slug, String, required: true
    end

    field :authors, [Types::AuthorType], null: false

    field :author, Types::AuthorType, null: true do
      argument :id, ID, required: true
    end

    def posts(published: nil)
      published.nil? ? Post.all.order(created_at: :desc) : Post.where(published:).order(created_at: :desc)
    end

    def post(slug:)
      Post.find_by(slug:)
    end

    def authors
      Author.all
    end

    def author(id:)
      Author.find(id)
    end
  end
end
