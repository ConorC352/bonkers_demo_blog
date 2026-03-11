module Mutations
  class PublishPost < Mutations::BaseMutation
    argument :id, ID, required: true

    type Types::PostType

    def resolve(id:)
      post = Post.find(id)
      post.update!(published: true, published_at: Time.current)
      post
    end
  end
end
