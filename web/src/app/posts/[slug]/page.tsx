import { PostDetail } from "@/components/PostDetail";

export default function PostPage({ params }: { params: { slug: string } }) {
  return <PostDetail slug={params.slug} />;
}
