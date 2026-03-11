alice = Author.find_or_create_by!(email: "alice@example.com") do |a|
  a.name = "Alice Smith"
end

bob = Author.find_or_create_by!(email: "bob@example.com") do |b|
  b.name = "Bob Jones"
end

post1 = Post.find_or_create_by!(slug: "getting-started-with-graphql") do |p|
  p.title        = "Getting Started with GraphQL"
  p.excerpt      = "A beginner-friendly introduction to GraphQL and why it replaces REST."
  p.content      = "## What is GraphQL?\n\nGraphQL is a query language for your API that gives clients exactly the data they ask for — nothing more, nothing less.\n\nUnlike REST, you have a single endpoint and describe your data requirements in the query itself."
  p.author       = alice
  p.published    = true
  p.published_at = Time.current
end

post2 = Post.find_or_create_by!(slug: "kubernetes-for-frontend-developers") do |p|
  p.title        = "Kubernetes for Frontend Developers"
  p.excerpt      = "You don't need to be a DevOps engineer to understand Kubernetes."
  p.content      = "## Why Kubernetes?\n\nKubernetes orchestrates containers at scale. Even as a frontend developer, understanding how your app is deployed gives you invaluable context.\n\nThis post walks through the key concepts: Pods, Deployments, Services and Ingress."
  p.author       = bob
  p.published    = true
  p.published_at = Time.current
end

Comment.find_or_create_by!(post: post1, author_name: "Conor", body: "Really clear explanation, thanks!")
Comment.find_or_create_by!(post: post2, author_name: "Alice", body: "Great intro to K8s!")
