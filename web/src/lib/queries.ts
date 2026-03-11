import { gql } from "@apollo/client";

export const GET_POSTS = gql`
  query GetPosts {
    posts(published: true) {
      id
      title
      slug
      excerpt
      publishedAt
      author {
        id
        name
      }
    }
  }
`;

export const GET_POST = gql`
  query GetPost($slug: String!) {
    post(slug: $slug) {
      id
      title
      slug
      content
      publishedAt
      author {
        id
        name
        email
      }
      comments {
        id
        body
        authorName
        createdAt
      }
    }
  }
`;

export const ADD_COMMENT = gql`
  mutation AddComment($postId: ID!, $body: String!, $authorName: String!) {
    addComment(postId: $postId, body: $body, authorName: $authorName) {
      id
      body
      authorName
      createdAt
    }
  }
`;
