"use client";

import { useState, useEffect } from "react";
import Link from "next/link";
import { useTranslation } from "@/hooks/useTranslation";
import { useDocumentMeta } from "@/hooks/useDocumentMeta";

interface Architecture {
  id: string;
  label: string;
  url: string;
  isCurrent: boolean;
}

interface Platform {
  id: string;
  name: string;
  icon: React.ReactNode;
  requirement: string;
  available: boolean;
  badge?: string;
  architectures: Architecture[];
}

/**
 * Download page - Qoder style
 */
export default function DownloadPage() {
  const { t } = useTranslation("portal");
  const [selectedPlatform, setSelectedPlatform] = useState("");
  const [expandedPlatform, setExpandedPlatform] = useState<string | null>(null);
  const [isAppleSilicon, setIsAppleSilicon] = useState(true);
  const [latestVersion, setLatestVersion] = useState("");

  // SEO
  useDocumentMeta({
    title: t("seo.download.title"),
    description: t("seo.download.description"),
  });

  // Fetch latest version
  useEffect(() => {
    const fetchLatestVersion = async () => {
      try {
        const response = await fetch(
          "https://asset.qritor.com/api/latest?platform=mac",
        );
        if (response.ok) {
          const data = await response.json();
          setLatestVersion(data.version);
        }
      } catch {
        // Don't show version on failure
      }
    };
    fetchLatestVersion();
  }, []);

  // Detect user OS
  useEffect(() => {
    const detectOS = () => {
      const userAgent = navigator.userAgent.toLowerCase();

      if (
        userAgent.includes("windows") ||
        userAgent.includes("win32") ||
        userAgent.includes("win64")
      ) {
        setSelectedPlatform("Windows");
        return;
      }

      if (userAgent.includes("mac") || userAgent.includes("macintosh")) {
        setSelectedPlatform("macOS");
        return;
      }

      setSelectedPlatform("macOS");
    };

    detectOS();
  }, []);

  // Detect Mac architecture
  useEffect(() => {
    const detectArch = async () => {
      try {
        const nav = navigator as Navigator & {
          userAgentData?: {
            getHighEntropyValues: (
              hints: string[],
            ) => Promise<{ architecture: string }>;
          };
        };
        if (nav.userAgentData) {
          const hints = await nav.userAgentData.getHighEntropyValues([
            "architecture",
          ]);
          setIsAppleSilicon(hints.architecture === "arm");
        } else {
          setIsAppleSilicon(true);
        }
      } catch {
        setIsAppleSilicon(true);
      }
    };
    detectArch();
  }, []);

  const platforms: Platform[] = [
    {
      id: "macOS",
      name: "macOS",
      icon: (
        <svg viewBox="0 0 24 24" fill="currentColor" width="20" height="20">
          <path d="M18.71 19.5c-.83 1.24-1.71 2.45-3.05 2.47-1.34.03-1.77-.79-3.29-.79-1.53 0-2 .77-3.27.82-1.31.05-2.3-1.32-3.14-2.53C4.25 17 2.94 12.45 4.7 9.39c.87-1.52 2.43-2.48 4.12-2.51 1.28-.02 2.5.87 3.29.87.78 0 2.26-1.07 3.81-.91.65.03 2.47.26 3.64 1.98-.09.06-2.17 1.28-2.15 3.81.03 3.02 2.65 4.03 2.68 4.04-.03.07-.42 1.44-1.38 2.83M13 3.5c.73-.83 1.94-1.46 2.94-1.5.13 1.17-.34 2.35-1.04 3.19-.69.85-1.83 1.51-2.95 1.42-.15-1.15.41-2.35 1.05-3.11z" />
        </svg>
      ),
      requirement: "macOS 11及以上",
      available: true,
      architectures: [
        {
          id: "arm64",
          label: "Mac ARM64 (Apple Silicon)",
          url: "https://asset.qritor.com/download/mac/arm64",
          isCurrent: isAppleSilicon,
        },
        {
          id: "x64",
          label: "Mac x64 (Intel)",
          url: "https://asset.qritor.com/download/mac/x64",
          isCurrent: !isAppleSilicon,
        },
      ],
    },
    {
      id: "Windows",
      name: "Windows",
      icon: (
        <svg viewBox="0 0 24 24" fill="currentColor" width="20" height="20">
          <path d="M3 12V6.75l6-1.32v6.48L3 12zm17-9v8.75l-10 .15V5.21L20 3zM3 13l6 .09v6.81l-6-1.15V13zm17 .25V22l-10-1.91V13l10 .25z" />
        </svg>
      ),
      requirement: "Windows 10/11",
      available: true,
      architectures: [
        {
          id: "setup",
          label: "Windows 安装版",
          url: "https://asset.qritor.com/download/win",
          isCurrent: true,
        },
        {
          id: "portable",
          label: "Windows 便携版",
          url: "https://asset.qritor.com/download/win/portable",
          isCurrent: false,
        },
      ],
    },
  ];

  const togglePlatform = (platformId: string) => {
    if (expandedPlatform === platformId) {
      setExpandedPlatform(null);
    } else {
      setExpandedPlatform(platformId);
    }
  };

  return (
    <div className="portal-page">
      <main className="download-page">
        {/* Page header - Qoder style: left-aligned */}
        <section className="download-hero">
          <div className="container">
            <h1 className="download-hero-title">{t("download.title")}</h1>
            <p className="download-hero-subtitle">
              {t("download.pageSubtitle")}
            </p>
          </div>
        </section>

        {/* Main download area */}
        <section className="download-main">
          <div className="container">
            <div className="download-panel">
              {/* Left: selector */}
              <div className="download-selector">
                <h2 className="download-product-title">Qritor Desktop</h2>
                <p className="download-product-desc">
                  {t("download.desktopFullDesc")}
                </p>

                <div className="download-links">
                  <Link href="/docs" className="download-link">
                    {t("common.learnMore")}
                    <svg
                      viewBox="0 0 24 24"
                      fill="none"
                      stroke="currentColor"
                      strokeWidth="2"
                      width="14"
                      height="14"
                    >
                      <path d="M7 17L17 7M17 7H7M17 7V17" />
                    </svg>
                  </Link>
                </div>

                {/* Platform list - Qoder style */}
                <div className="qoder-platform-list">
                  {platforms.map((platform) => (
                    <div key={platform.id} className="qoder-platform-wrapper">
                      {/* Platform selection item */}
                      <button
                        className={`qoder-platform-item ${selectedPlatform === platform.id ? "active" : ""} ${!platform.available ? "disabled" : ""}`}
                        onClick={() =>
                          platform.available && togglePlatform(platform.id)
                        }
                        disabled={!platform.available}
                      >
                        <span className="qoder-platform-icon">
                          {platform.icon}
                        </span>
                        <span className="qoder-platform-name">
                          {platform.name}
                        </span>
                        {platform.badge && (
                          <span className="qoder-platform-badge">
                            {platform.badge}
                          </span>
                        )}
                        <span className="qoder-platform-req">
                          {platform.requirement}
                        </span>
                        {platform.available && (
                          <span
                            className={`qoder-platform-arrow ${expandedPlatform === platform.id ? "expanded" : ""}`}
                          >
                            <svg
                              viewBox="0 0 24 24"
                              fill="none"
                              stroke="currentColor"
                              strokeWidth="2"
                              width="20"
                              height="20"
                            >
                              <polyline points="6 9 12 15 18 9" />
                            </svg>
                          </span>
                        )}
                      </button>

                      {/* Architecture dropdown */}
                      {platform.available &&
                        expandedPlatform === platform.id &&
                        platform.architectures && (
                          <div className="qoder-arch-dropdown">
                            {platform.architectures.map((arch) => (
                              <a
                                key={arch.id}
                                href={arch.url}
                                className="qoder-arch-item"
                                download
                              >
                                <span className="qoder-arch-label">
                                  {arch.label}
                                </span>
                                <span className="qoder-arch-download">
                                  <svg
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    strokeWidth="2"
                                    width="20"
                                    height="20"
                                  >
                                    <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4" />
                                    <polyline points="7 10 12 15 17 10" />
                                    <line x1="12" y1="15" x2="12" y2="3" />
                                  </svg>
                                </span>
                              </a>
                            ))}
                          </div>
                        )}
                    </div>
                  ))}
                </div>

                <p className="download-version">
                  {latestVersion ? `v${latestVersion}` : ""}
                </p>
              </div>

              {/* Right: product preview */}
              <div className="download-preview">
                <img
                  src="/images/desktop-preview.png"
                  alt="Qritor Desktop"
                  className="preview-screenshot"
                />
              </div>
            </div>
          </div>
        </section>
      </main>
    </div>
  );
}
