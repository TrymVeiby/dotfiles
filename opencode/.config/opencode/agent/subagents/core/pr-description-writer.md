---
allowed-tools: Read, Grep, Glob, Task
argument-hint: [#issue-number]
description: Generate a Norwegian PR description in markdown based on provided context
---

## Input

$ARGUMENTS

## Your task

Generate a pull request description using only the context provided by the caller. Do not run git/gh commands or infer repository state. Output must be markdown and must follow the exact template below with the same headings and order. Output only the markdown; no extra text before or after.

### Rules

- Use only the caller-provided context (diffs, summaries, file excerpts).
- Do not mention missing diffs, branches, or repository state.
- Be specific and concrete; avoid vague words like "oppdatert" or "forbedret".
- Include file paths when describing changes.
- If there are no changes described in the context, write: "Ingen endringer funnet i konteksten" in Hvorfor and Beskrivelse av løsning, and keep the rest minimal.

### Issue number

- Input like `#190` or `190` means issue number 190.
- If no input, omit the closes line.

### English title

- Use format: `feat: ...` or `fix: ...` based on the change intent.
- Keep it concise and specific.

### Required output (markdown)

```markdown
## Tittel
[English title]

## Hvorfor
[Explain the problem/need this PR addresses.]
[If issue number provided: On new line: "Closes #XXX"]

## Beskrivelse av løsning
[Detailed explanation based on the provided context:]
- [Key change 1 with file reference]
- [Key change 2 with file reference]
- [Key change 3 with file reference]
[Add technical details as needed]

## Hvordan teste endringen
1. [Step one]
2. [Step two]
3. [Expected result]

## Visuelle endringer
[If visual changes are described in the context, summarize them. Otherwise: "Ingen visuelle endringer"]

---
🤖 Generert med [Claude Code](https://claude.com/claude-code)
```

### Additional guidance

- Preserve any existing "Visuelle endringer" section provided in the context, including images.
- Make testing steps realistic and derived from the described changes.
- Ensure all sections are present and in the exact order shown.
