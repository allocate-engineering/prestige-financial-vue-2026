# Answer key — Global `Window` augmentation (advanced TS)

> **Internal — do not ship to the candidate.** Keep this file out of the
> branch you hand to the interviewee (delete it, or keep it only on an
> internal/solutions branch).

## The seeded problem

`src/App.vue` assigns a custom property to the global object:

```ts
// Exposed for debugging / e2e access from the browser console.
window.__PRESTIGE__ = { firebase: firebaseApp }
```

This raises:

```
src/App.vue: error TS2339: Property '__PRESTIGE__' does not exist on
type 'Window & typeof globalThis'.
```

The app still **runs** (Vite/esbuild is transpile-only). The error only
appears in the IDE and via `npm run typecheck` (`vue-tsc --noEmit`).

## What we're testing

The candidate must add the property to `Window`'s type **without**
suppressing or escaping the type system.

## Model solution

Create an ambient declaration file:

```ts
// src/types/window.d.ts
import type { FirebaseApp } from 'firebase/app'

declare global {
  interface Window {
    __PRESTIGE__?: { firebase: FirebaseApp }
  }
}

export {}
```

`npm run typecheck` no longer reports the `__PRESTIGE__` error.
(`src/**/*.ts` already includes `.d.ts`, so no tsconfig change is needed.)

## Grading rubric

| Approach | Signal |
| --- | --- |
| `// @ts-ignore` / `@ts-expect-error` | ❌ Suppresses, doesn't type. Avoids the problem. |
| `(window as any).__PRESTIGE__` | ❌ Escapes the type system; loses safety everywhere. |
| `(window as Window & { __PRESTIGE__: ... })` | ⚠️ Local cast — works at one site, not reusable. |
| `declare global { interface Window {...} }` | ✅ Correct global augmentation, typesafe everywhere. |

### Bonus senior signals

- Types the value **precisely** (`{ firebase: FirebaseApp }`), not `any`.
- Makes it **optional** (`__PRESTIGE__?:`) since it's injected at runtime.
- Knows that a `declare global` placed inside a **module** `.ts` file (e.g.
  directly in `main.ts`) requires `export {}` (or an existing import/export),
  otherwise: *"Augmentations for the global scope can only be directly nested
  in external modules or ambient module declarations."* The existing
  `src/shims-vue.d.ts` (`declare module "@vue/test-utils"`) is a nearby
  example of declaration merging they may reference.

## Note: this task vs. the rest of the interview

`npm run typecheck` reports the `TopStocksPage.vue` errors too (Task 4 — fix
the top stocks page). So a fully green `typecheck` means **every** TS task is
done — it is not a per-task gate. To grade this task (Task 6) in isolation,
look specifically for the `src/App.vue` `__PRESTIGE__` error clearing.
