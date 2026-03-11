import type { Metadata } from "next";
import "./globals.css";
import { ApolloWrapper } from "@/components/ApolloWrapper";

export const metadata: Metadata = {
  title: "Dev Blog",
  description: "A demo blog built with Next.js, GraphQL and Kubernetes",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body className="bg-gray-50 text-gray-900 antialiased">
        <ApolloWrapper>
          <header className="border-b border-gray-200 bg-white">
            <div className="mx-auto max-w-3xl px-4 py-5 flex items-center justify-between">
              <a href="/" className="text-xl font-bold tracking-tight">Dev Blog</a>
            </div>
          </header>
          <main className="mx-auto max-w-3xl px-4 py-10">{children}</main>
        </ApolloWrapper>
      </body>
    </html>
  );
}
