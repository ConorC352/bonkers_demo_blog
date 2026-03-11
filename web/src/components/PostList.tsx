"use client";
import { useQuery } from "@apollo/client";
import { GET_POSTS } from "@/lib/queries";
import { PostCard } from "./PostCard";

type Post = {
  id: string;
  title: string;
  slug: string;
  excerpt: string;
  publishedAt: string;
  author: { id: string; name: string };
};

export function PostList() {
  const { data, loading, error } = useQuery<{ posts: Post[] }>(GET_POSTS);
  if (loading) return <p className="text-gray-400">Loading posts…</p>;
  if (error) return <p className="text-red-500">Error loading posts: {error.message}</p>;
  return (
    <div className="space-y-6">
      {data?.posts.map((post) => <PostCard key={post.id} post={post} />)}
    </div>
  );
}
