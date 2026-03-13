Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  if Rails.env.development?
    mount GraphQL::Dashboard, at: "/graphql/dashboard", schema: BlogSchema
  end

  get "/up", to: proc { [200, {}, ["ok"]] }
end