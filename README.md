# Prestige Financial — Technical Interview

Welcome! This is a small Vue 3 + TypeScript + Pinia app. You'll work through a
series of tasks that touch styling, data fetching, routing, and TypeScript.

> Work on a branch and commit as you go — we care about how you get there, not
> just the final state.

## Prerequisites

- Node.js 20.x or higher (see `.nvmrc`).
- Visual Studio Code with the
  [Portable Kanban](https://marketplace.visualstudio.com/items?itemName=harehare.portable-kanban)
  extension installed. This extension is used to view and manage your tasks
  during the interview. (VS Code will also prompt you to install it from this
  project's recommended extensions.)

## Setup

```bash
npm install
npm run dev        # start the dev server (http://localhost:3000)
```

Other useful commands:

| Command | What it does |
| --- | --- |
| `npm run dev` | Start the Vite dev server with HMR |
| `npm run build` | Production build |
| `npm run typecheck` | Type-check the project (`vue-tsc --noEmit`) |
| `npm run test` | Run unit tests (Vitest) |

Login credentials for the app: **qesandbox@gmail.com** / **test123**

> **Note:** Vite/esbuild does not type-check at dev or build time, so the app
> can run while `npm run typecheck` still reports errors. Use `npm run typecheck`
> (or your editor) to find type problems.

## Accessing your tasks

This project uses the Portable Kanban extension to manage the interview tasks:

1. Open this project in Visual Studio Code.
2. Open the Extensions view (`Ctrl+Shift+X` / `Cmd+Shift+X`) and make sure the
   **Portable Kanban** extension is installed.
3. Open the `tasks.kanban` file at the root of the project.
4. The Portable Kanban board opens automatically, showing your tasks in
   **Todo** / **Doing** / **Done** columns. Drag cards between columns as you
   work through them.

> **Design mockups:** The Portable Kanban webview cannot render images, so the
> mockups referenced in the tasks won't appear on the board. See
> [`TASKS.md`](./TASKS.md) for the same tasks with the mockups displayed
> (open it with VS Code's built-in Markdown preview, `Cmd/Ctrl+Shift+V`).
