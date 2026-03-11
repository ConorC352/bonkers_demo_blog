module Types
  class MutationType < Types::BaseObject
    field :create_post,  mutation: Mutations::CreatePost
    field :update_post,  mutation: Mutations::UpdatePost
    field :publish_post, mutation: Mutations::PublishPost
    field :delete_post,  mutation: Mutations::DeletePost
    field :add_comment,  mutation: Mutations::AddComment
  end
end
