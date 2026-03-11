module Mutations
  class AddComment < Mutations::BaseMutation
    argument :post_id,     ID,     required: true
    argument :body,        String, required: true
    argument :author_name, String, required: true

    type Types::CommentType

    def resolve(post_id:, body:, author_name:)
      post = Post.find(post_id)
      post.comments.create!(body:, author_name:)
    end
  end
end
