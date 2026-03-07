"use client";

import { useEffect, useMemo, useState } from "react";
import { useParams } from "next/navigation";
import Link from "next/link";
import { docsContent } from "@/data/docsData";

/**
 * Extract text and generate an anchor ID
 */
function generateId(text: string): string {
  return text
    .replace(/<[^>]+>/g, "") // remove html
    .replace(/\[([^\]]+)\]\([^)]+\)/g, "$1") // remove markdown links
    .replace(/[*_`]/g, "") // remove styling
    .toLowerCase()
    .replace(/\s+/g, "-")
    .replace(/[^a-z0-9\u4e00-\u9fa5\-]+/g, "")
    .replace(/(^-|-$)/g, "");
}

/**
 * Extract headings for the TOC
 */
function extractHeadings(markdown: string) {
  const headings: { id: string; title: string; level: number }[] = [];
  const regex = /^(##|###) (.+)$/gm;
  let match;
  while ((match = regex.exec(markdown)) !== null) {
    const level = match[1].length;
    const titleRaw = match[2];
    const title = titleRaw
      .replace(/\[([^\]]+)\]\([^)]+\)/g, "$1")
      .replace(/[*_`]/g, "");
    const id = generateId(titleRaw);
    headings.push({ id, title, level });
  }
  return headings;
}

/**
 * Simple Markdown to HTML formatter
 */
function formatContent(markdown: string): string {
  if (!markdown) return "";

  // First, extract and convert tables to HTML before other processing
  let html = markdown.replace(
    /(?:^|\n)((?:\|.+\|\n)+)/g,
    (_match, tableBlock: string) => {
      const rows = tableBlock
        .trim()
        .split("\n")
        .filter((r: string) => r.trim());
      if (rows.length < 2) return tableBlock;

      // Check if second row is separator (|---|---|)
      const isSeparator = /^\|[\s-:|]+\|$/.test(rows[1].trim());
      if (!isSeparator) return tableBlock;

      const parseRow = (row: string) =>
        row
          .split("|")
          .slice(1, -1)
          .map((cell: string) => cell.trim());

      const headerCells = parseRow(rows[0]);
      const datRows = rows.slice(2);

      let table = '<table class="docs-table"><thead><tr>';
      headerCells.forEach((cell: string) => {
        table += `<th>${cell}</th>`;
      });
      table += "</tr></thead><tbody>";
      datRows.forEach((row: string) => {
        const cells = parseRow(row);
        table += "<tr>";
        cells.forEach((cell: string) => {
          table += `<td>${cell}</td>`;
        });
        table += "</tr>";
      });
      table += "</tbody></table>";
      return "\n" + table + "\n";
    },
  );

  html = html
    // Headings (process from small to large to avoid mismatching)
    .replace(/^#### (.+)$/gm, "<h4>$1</h4>")
    .replace(
      /^### (.+)$/gm,
      (_match, title) => `<h3 id="${generateId(title)}">${title}</h3>`,
    )
    .replace(
      /^## (.+)$/gm,
      (_match, title) => `<h2 id="${generateId(title)}">${title}</h2>`,
    )
    // Blockquotes
    .replace(/^> (.+)$/gm, "<blockquote>$1</blockquote>")
    // Images
    .replace(
      /!\[(.+?)\]\((.+?)\)/g,
      '<img src="$2" alt="$1" class="docs-image" />',
    )
    // Lists
    .replace(/^(\d+)\. (.+)$/gm, "<li>$2</li>")
    .replace(/^- (.+)$/gm, "<li>$1</li>")
    // Bold
    .replace(/\*\*(.+?)\*\*/g, "<strong>$1</strong>")
    // Links
    .replace(/\[(.+?)\]\((.+?)\)/g, '<a href="$2">$1</a>')
    // Code
    .replace(/`(.+?)`/g, "<code>$1</code>")
    // Paragraphs
    .replace(/\n\n/g, "</p><p>");

  // Wrap lists
  html = html.replace(/(<li>.*?<\/li>\n?)+/g, "<ul>$&</ul>");

  return `<p>${html}</p>`;
}

/**
 * Docs content page
 */
export default function DocsContentPage() {
  const params = useParams();
  const lang = (params.lang as string) || "zh";
  const slug = params.slug as string[];

  const [activeId, setActiveId] = useState<string>("");

  // Get page ID from slug path
  const pageId = slug?.[slug.length - 1] || "overview";
  const content = docsContent[lang]?.[pageId] || docsContent.zh?.[pageId];

  const headings = useMemo(
    () => (content ? extractHeadings(content.body) : []),
    [content],
  );

  useEffect(() => {
    if (!content || headings.length === 0) return;

    const handleScroll = () => {
      const scrollPosition = window.scrollY + 120; // Offset for fixed header

      let current = "";
      for (const h of headings) {
        const el = document.getElementById(h.id);
        if (!el) continue;

        const absoluteTop = el.getBoundingClientRect().top + window.scrollY;
        if (absoluteTop <= scrollPosition) {
          current = h.id;
        } else {
          break;
        }
      }
      if (current) setActiveId(current);
      else if (headings.length > 0) setActiveId(headings[0].id);
    };

    window.addEventListener("scroll", handleScroll, { passive: true });
    // Delay initial check slightly to ensure innerHTML has fully painted
    setTimeout(handleScroll, 100);

    return () => window.removeEventListener("scroll", handleScroll);
  }, [content, headings]);

  if (!content) {
    const notFoundText: Record<
      string,
      { title: string; desc: string; back: string }
    > = {
      zh: {
        title: "页面未找到",
        desc: "抱歉、您访问的文档页面不存在。",
        back: "返回文档首页",
      },
      en: {
        title: "Page Not Found",
        desc: "Sorry, the documentation page you requested does not exist.",
        back: "Back to Docs Home",
      },
    };
    const text = notFoundText[lang] || notFoundText.zh;
    return (
      <div className="docs-content-body">
        <h1 className="docs-content-title">{text.title}</h1>
        <p>{text.desc}</p>
        <Link href={`/docs/${lang}/`} className="btn btn-primary">
          {text.back}
        </Link>
      </div>
    );
  }

  return (
    <div className="docs-page-layout">
      <div className="docs-page-content">
        {/* Page header */}
        <div className="docs-content-header">
          <div className="docs-breadcrumb">
            <span>{content.breadcrumb}</span>
          </div>
          <h1 className="docs-content-title">{content.title}</h1>
          {content.description && (
            <p className="docs-content-description">{content.description}</p>
          )}
        </div>

        {/* Body content */}
        <div
          className={`docs-content-body${content.layout === "stepper" ? " docs-stepper" : ""}`}
          dangerouslySetInnerHTML={{ __html: formatContent(content.body) }}
        />

        {/* Quick links */}
        {content.quickLinks && content.quickLinks.length > 0 && (
          <div className="docs-quick-links">
            {content.quickLinks.map(
              (
                link: { path: string; title: string; description: string },
                index: number,
              ) => (
                <Link key={index} href={link.path} className="docs-quick-link">
                  <div className="docs-quick-link-content">
                    <span className="docs-quick-link-title">{link.title}</span>
                    <span className="docs-quick-link-desc">
                      {link.description}
                    </span>
                  </div>
                  <svg
                    className="docs-quick-link-icon"
                    width="20"
                    height="20"
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    strokeWidth="2"
                  >
                    <line x1="7" y1="17" x2="17" y2="7"></line>
                    <polyline points="7 7 17 7 17 17"></polyline>
                  </svg>
                </Link>
              ),
            )}
          </div>
        )}
      </div>

      {/* Right side TOC */}
      {headings.length > 0 && (
        <aside className="docs-toc">
          <ul className="docs-toc-list">
            {headings.map((heading, index) => (
              <li
                key={`${heading.id}-${index}`}
                className={`docs-toc-item docs-toc-level-${heading.level}`}
              >
                <a
                  href={`#${heading.id}`}
                  className={activeId === heading.id ? "active" : ""}
                  onClick={(e) => {
                    e.preventDefault();
                    setActiveId(heading.id);
                    const el = document.getElementById(heading.id);
                    if (el) {
                      const y =
                        el.getBoundingClientRect().top + window.scrollY - 80;
                      window.scrollTo({ top: y, behavior: "smooth" });
                      window.history.pushState(null, "", `#${heading.id}`);
                    }
                  }}
                >
                  {heading.title}
                </a>
              </li>
            ))}
          </ul>
        </aside>
      )}
    </div>
  );
}
