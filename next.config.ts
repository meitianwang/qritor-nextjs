import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  output: "standalone",

  serverExternalPackages: ["bcryptjs", "nodemailer"],

  async headers() {
    return [
      {
        source: "/api/:path*",
        headers: [
          { key: "Access-Control-Allow-Credentials", value: "true" },
          {
            key: "Access-Control-Allow-Origin",
            value: process.env.BACKEND_CORS_ORIGINS?.split(",")[0] || "*",
          },
          {
            key: "Access-Control-Allow-Methods",
            value: "GET,POST,PUT,DELETE,OPTIONS,PATCH",
          },
          {
            key: "Access-Control-Allow-Headers",
            value: "Content-Type, Authorization, X-Requested-With",
          },
        ],
      },
    ];
  },
};

export default nextConfig;
