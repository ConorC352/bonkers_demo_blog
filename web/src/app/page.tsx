import { PostList } from "@/components/PostList";

export default function HomePage() {
  return (
    <div>
      <h1 className="text-3xl font-bold mb-2">Latest Posts</h1>
      <p className="text-gray-500 mb-8">Thoughts on engineering and technology.</p>
      <PostList />
    </div>
  );
}
