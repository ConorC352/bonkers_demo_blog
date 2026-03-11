"use client";
import { useQuery } from "@apollo/client";
import { GET_POST } from "@/lib/queries";
import { CommentForm } from "./CommentForm";

type Comment = { id: string; body: string; authorName: string; createdAt: string };
type Post = {
  id: string; title: string; content: string; publishedAt: string;
  author: { id: string; name: string; email: string };
  comments: Comment[];
};

export function PostDetail({ slug }: { slug: string }) {
  const { data, loading, error, refetch } = useQuery<{ post: Post }>(GET_POST, { variables: { slug } });
  if (loading) return <p className="text-gray-400">Loading…</p>;
  if (error) return <p className="text-red-500">Error: {error.message}</p>;
  if (!data?.post) return <p>Post not found.</p>;
  const { post } = data;
  return (
    <article>
      <header className="mb-8">
        <h1 className="text-4xl font-bold mb-3">{post.title}</h1>
        <p className="text-gray-400 text-sm">
          By {post.author.name} · {new Date(post.publishedAt).toLocaleDateString("en-IE", {
            day: "numeric", month: "long", year: "numeric",
          })}
        </p>
      </header>
      <div className="prose prose-gray max-w-none mb-12 leading-relaxed">
        {post.content.split("\n").map((line, i) => <p key={i} className="mb-4">{line}</p>)}
      </div>
      <section className="mt-12 border-t border-gray-200 pt-8">
        <h2 className="text-xl font-semibold mb-6">Comments ({post.comments.length})</h2>
        <div className="space-y-4 mb-8">
          {post.comments.map((comment) => (
            <div key={comment.id} className="bg-white border border-gray-200 rounded-lg p-4">
              <p className="text-sm font-medium text-gray-700 mb-1">{comment.authorName}</p>
              <p className="text-gray-600 text-sm">{comment.body}</p>
              <p className="text-xs text-gray-400 mt-2">{new Date(comment.createdAt).toLocaleDateString("en-IE")}</p>
            </div>
          ))}
          {post.comments.length === 0 && <p className="text-gray-400 text-sm">No comments yet. Be the first!</p>}
        </div>
        <CommentForm postId={post.id} onCommentAdded={() => refetch()} />
      </section>
    </article>
  );
}
