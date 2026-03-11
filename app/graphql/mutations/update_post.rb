module Mutations
  class UpdatePost < Mutations::BaseMutation
    argument :id,      ID,     required: true
    argument :title,   String, required: false
    argument :excerpt, String, required: false
    argument :content, String, required: false

    type Types::PostType

    def resolve(id:, **attrs)
      post = Post.find(id)
      post.update!(attrs.compact)
      post
    end
  end
end
