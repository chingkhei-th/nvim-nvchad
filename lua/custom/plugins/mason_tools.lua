-- Mason: auto-install LSP servers, formatters, and linters
-- Run :MasonToolsInstall after adding new entries here

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- ── LSP Servers ──────────────────────────────────────────────────
        "html-lsp",               -- HTML
        "css-lsp",                -- CSS
        "cssmodules-language-server", -- CSS Modules
        "typescript-language-server", -- JS / TS / React / Next.js (ts_ls)
        "eslint-lsp",             -- ESLint (linting + auto-fix)
        "volar",                  -- Vue 3 / Nuxt
        "tailwindcss-language-server", -- Tailwind CSS
        "json-lsp",               -- JSON (package.json, tsconfig, etc.)
        "yaml-language-server",   -- YAML (GitHub Actions, docker-compose)
        "emmet-language-server",  -- Emmet abbreviations in HTML/CSS/JSX
        "prisma-language-server", -- Prisma ORM
        "sql-formatter",          -- SQL formatting
        "sqlls",                  -- SQL LSP

        -- ── Formatters ───────────────────────────────────────────────────
        "prettier",               -- HTML, CSS, JS, TS, Vue, JSON, YAML, MD
        "prettierd",              -- Faster prettier daemon (conform will use this)
        "prisma-fmt",             -- Prisma schema formatter (via prismals)

        -- ── Linters ──────────────────────────────────────────────────────
        "eslint_d",               -- Faster ESLint daemon for linting
        "stylelint",              -- CSS / SCSS linter
      },
    },
  },
}
