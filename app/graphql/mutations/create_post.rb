module Mutations
  class CreatePost < Mutations::BaseMutation
    argument :title,     String, required: true
    argument :excerpt,   String, required: true
    argument :content,   String, required: true
    argument :author_id, ID,     required: true

    type Types::PostType

    def resolve(title:, excerpt:, content:, author_id:)
      Post.create!(title:, excerpt:, content:, author_id:)
    end
  end
end
