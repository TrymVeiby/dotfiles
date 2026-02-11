---
name: pr-description
description: Create or update a pull request description from actual branch changes. Use when the user asks to draft, improve, or refresh PR text, especially when the output must be Norwegian Markdown and may need issue linking from input like #123.
---

# PR Writer Agent (Minimal)

## Input

$ARGUMENTS

## Task

Create or update a PR description from real branch changes.
Write Norwegian text.
Return Markdown only.

## Data Rules

- Use GitHub MCP for repo, branch, PR, and diff data.
- Do not use `gh` or `git` for PR/diff discovery.
- Local reads allowed for `.git/config` and `.git/HEAD`.

## Workflow

1. Resolve repo and branch:
- Parse `owner/repo` from `.git/config`.
- Parse current branch from `.git/HEAD`.
- Resolve base branch: `main` -> `master` -> default -> first available.

2. Find existing PR:
- `github_list_pull_requests` with `state: all` and `head: "{owner}:{branch}"`.
- Keep latest PR if found.

3. Gather change context:
- Existing PR: `get_files`, `get_diff`, `get` (to preserve `## Visuelle endringer` and image links).
- No PR: create draft PR, then read `get_files` and `get_diff`.

4. Parse issue from input:
- If input is `#123` or `123`, include `Closes #123` under `## Hvorfor`.

5. Generate title in English:
- Use conventional prefix: `feat:`, `fix:`, `refactor:`, `chore:`, `docs:`, `test:`.

6. Generate/update body in Norwegian with exact headings:
- `## Hvorfor`
- `## Beskrivelse av løsning`
- `## Hvordan teste endringen`
- `## Visuelle endringer`

7. Output:
- Markdown only.
- No preamble.
- No text outside the template.
- No code fences unless explicitly requested.

## Template

```md
## Hvorfor

[Kort problem/behov basert på faktiske endringer]
[Hvis issue: Closes #XXX]

## Beskrivelse av løsning

- [Endring 1 i `path/to/file.ext`]
- [Endring 2 i `path/to/another_file.ext`]
- [Endring 3 i `folder/file.ext`]

## Hvordan teste endringen

1. [Steg 1]
2. [Steg 2]
3. [Forventet resultat]

## Visuelle endringer

[Behold eksisterende seksjon hvis PR finnes, ellers beskriv UI-endringer eller skriv "Ingen visuelle endringer"]
```

## Quality Rules

- Be concrete; avoid vague wording.
- Wrap all file references in inline code tags, for example `src/app.ts`.
- Infer and reflect change type (feature/fix/refactor/chore/docs/test).
- If no diff exists, return:
  - `## Feil`
  - `Ingen endringer funnet på branchen.`
