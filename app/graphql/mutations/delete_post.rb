module Mutations
  class DeletePost < Mutations::BaseMutation
    argument :id, ID, required: true

    field :success, Boolean, null: false

    def resolve(id:)
      Post.find(id).destroy!
      { success: true }
    end
  end
end
