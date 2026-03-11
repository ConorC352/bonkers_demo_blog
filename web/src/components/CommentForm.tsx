"use client";
import { useMutation } from "@apollo/client";
import { useState } from "react";
import { ADD_COMMENT } from "@/lib/queries";

type Props = { postId: string; onCommentAdded: () => void };

export function CommentForm({ postId, onCommentAdded }: Props) {
  const [authorName, setAuthorName] = useState("");
  const [body, setBody] = useState("");
  const [addComment, { loading }] = useMutation(ADD_COMMENT);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!authorName.trim() || !body.trim()) return;
    await addComment({ variables: { postId, body, authorName } });
    setAuthorName(""); setBody("");
    onCommentAdded();
  };

  return (
    <form onSubmit={handleSubmit} className="space-y-4">
      <h3 className="text-lg font-semibold">Leave a comment</h3>
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Name</label>
        <input type="text" value={authorName} onChange={(e) => setAuthorName(e.target.value)}
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          placeholder="Your name" required />
      </div>
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Comment</label>
        <textarea value={body} onChange={(e) => setBody(e.target.value)} rows={4}
          className="w-full border border-gray-300 rounded-lg px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
          placeholder="Share your thoughts…" required />
      </div>
      <button type="submit" disabled={loading}
        className="bg-blue-600 text-white px-4 py-2 rounded-lg text-sm font-medium hover:bg-blue-700 disabled:opacity-50 transition-colors">
        {loading ? "Posting…" : "Post comment"}
      </button>
    </form>
  );
}
