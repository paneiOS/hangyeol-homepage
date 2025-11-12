# HANGYEOL AGRICULTURE — Website

Static, single-file site with Tailwind CDN, multilingual content, and light enhancements (dark mode, i18n persistence, SEO).

Note for maintainers (process images)
- Quality/detail process images are referenced with English filenames under `docs/process`:
  `01-cold-storage.jpg` ... `25-outbound-room.jpg`.
- If you drop Korean-named images (e.g., `1.저온창고.jpg`), run the helper script below to rename them.

Helper (one-off) renamer
```
bash scripts/rename-process-images.sh
```

## Quick Start

- With pnpm (recommended)
  - Install once: `pnpm install`
  - Dev server: `pnpm dev` → http://localhost:5173/
  - Preview (build output): `pnpm preview` → http://localhost:5173/
- Without installing dev deps
  - `pnpm dlx vite` → http://localhost:5173/
  - or `python3 -m http.server 5173` (no HMR, just static serve)

## Check Before Push

- Favicon: open `/favicon.svg` in the browser directly
- SEO files: `/robots.txt`, `/sitemap.xml`
- UI: language switch persists, dark mode toggle, mobile menu

## Deploy (Vercel)

- Commit and push to GitHub; Vercel auto‑deploys
- This repo deploys as a static site (no build step required)
- `vercel.json` adds basic caching headers

## Files

- `index.html` — main page
- `favicon.svg` — site icon
- `robots.txt`, `sitemap.xml` — SEO basics
- `package.json` — dev server scripts (Vite)
- `.gitignore`, `vercel.json` — housekeeping

## Notes

- Absolute URLs like `/favicon.svg` require a server (works in dev server and Vercel). Opening index.html with `file://` will not show the favicon.
- If you add assets, keep them at project root or a `public/` folder. Update paths accordingly.
