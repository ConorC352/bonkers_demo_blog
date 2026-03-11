type Post = {
  id: string;
  title: string;
  slug: string;
  excerpt: string;
  publishedAt: string;
  author: { id: string; name: string };
};

export function PostCard({ post }: { post: Post }) {
  return (
    <article className="bg-white border border-gray-200 rounded-xl p-6 hover:shadow-md transition-shadow">
      <p className="text-sm text-gray-400 mb-1">
        {new Date(post.publishedAt).toLocaleDateString("en-IE", {
          day: "numeric", month: "long", year: "numeric",
        })} · {post.author.name}
      </p>
      <h2 className="text-xl font-semibold mb-2">
        <a href={`/posts/${post.slug}`} className="hover:text-blue-600 transition-colors">{post.title}</a>
      </h2>
      <p className="text-gray-600 text-sm leading-relaxed">{post.excerpt}</p>
      <a href={`/posts/${post.slug}`} className="mt-4 inline-block text-sm font-medium text-blue-600 hover:underline">
        Read more →
      </a>
    </article>
  );
}
