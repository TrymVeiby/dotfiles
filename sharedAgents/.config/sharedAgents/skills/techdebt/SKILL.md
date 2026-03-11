---
name: techdebt
description: Find duplicate code and architecture issues introduced in the current coding session by reviewing local diffs and nearby context.
metadata:
  short-description: Review current-session code changes for tech debt risks
---

# Tech Debt Review

Use this skill when the user asks for a tech debt check, duplication review, or architecture quality pass.

## Scope

Focus on code introduced or changed in the current session:
- `git diff` (unstaged)
- `git diff --cached` (staged)
- Newly added files

If git context is unavailable, review the files explicitly mentioned by the user.

## Workflow

1. Collect the change set from local diffs.
2. For each changed file, inspect nearby code to understand local patterns and existing abstractions.
3. Identify and prioritize:
   - Duplicate logic (same behavior implemented more than once)
   - Missing abstractions (copy-pasted blocks that should be extracted)
   - Architecture drift (layer violations, leaking responsibilities, tight coupling)
   - Short-term fixes that increase future maintenance cost
4. Propose concrete refactors with low-risk migration steps.
5. Report findings by severity with exact file references and line numbers.

## Output Format

Return findings first, ordered by severity:
- `High`: likely bugs, brittle coupling, major duplication
- `Medium`: maintainability problems that will compound
- `Low`: minor cleanup or style-level debt

For each finding include:
- What is wrong
- Why it matters
- Exact file reference(s)
- A specific fix

If no issues are found, state that explicitly and list residual risks or test gaps.
