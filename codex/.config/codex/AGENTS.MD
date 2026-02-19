## General

- Work incrementally in small, clearly scoped steps.
- Prefer creating a new file for a new component, then import it where needed.
- If something is unclear, stop and ask before continuing.

## Preferred stack

- TypeScript/Node.js
- Next.js
- React
- Astro

## Code priorities

- Prioritize readability first.
- Keep solutions simple.
- Aim for robust, secure implementations.

## TypeScript style

- Prefer `function` declarations over arrow functions when taking input and returning output.
- Use `camelCase` for regular naming.
- Keep comments minimal.
- Add short docstrings for functions when useful.
- Add brief comments when chaining complex operations (for example `map`/`sort`/`filter`) where intent is not obvious.

## Workflow

- Make small incremental changes so they are easy to review.
- Do not run tests/lint automatically unless explicitly requested.
- Do not create commits unless explicitly requested.
- If commit help is requested, suggest messages using styles like `feat`, `fix`, and `chore`.
- Allways describe what a command you are about to run does before running it, and ask for confirmation if it will make changes to the codebase.

## Next.js and React conventions

- Prefer Server Components by default in Next.js.
- Use Client Components only when needed (state, effects, browser APIs, or event-heavy UI).
- Keep data fetching close to where data is used.
- Keep components small and focused; split when a file gets hard to scan.
- Move reusable UI parts into separate component files.
- Prefer explicit props interfaces for non-trivial components.
- Use clear loading and error states for async UI.
- Avoid unnecessary abstractions; duplicate a little before introducing shared utilities.
- Keep business logic out of JSX when possible; extract to named helper functions.

## Astro conventions

- Keep pages mostly static by default.
- Introduce hydration only for interactive islands that need it.
- Use React components as islands when interactivity is required.
- Keep content and layout structure simple and predictable.
- Prefer straightforward file-based routing and avoid clever routing patterns.

## File and naming conventions

- Use `camelCase` for variables and functions.
- Use `PascalCase` for React component names and component file names.
- Keep one main component per file.
- Use descriptive names over short or clever names.
- Co-locate related files when it improves discoverability.

## Safety and robustness

- Validate external input at boundaries (API routes, actions, and forms).
- Handle null and undefined cases explicitly.
- Fail safely with clear error handling instead of silent fallbacks.
- Prefer typed contracts between layers (request/response and domain models).
