---
allowed-tools: Bash(gh:*), Bash(git:*), Read, Grep, Glob, Task
argument-hint: [#issue-number]
description: Create a PR with proper Norwegian description based on branch changes
---

## Input

$ARGUMENTS

## Your task

Create or update a pull request with a Norwegian description analyzing the actual changes made in the current branch. If a PR already exists on this branch, update it while preserving images and the "Visuelle endringer" section.

### Step 1: Check for Existing PR

Get current branch name: `git rev-parse --abbrev-ref HEAD`
Check if PR exists: `gh pr list --head [branch-name] --state all`

- If PR exists: Get PR number and existing body: `gh pr view [pr-number] --json body`
- Store the PR number for later updating

### Step 2: Parse Issue Number (if provided)

Check if user provided an issue number:

- Input like `#190` or `190` should be treated as issue number
- No input means no linked issue
- Store the issue number for later use in the PR description

### Step 3: Gather Branch Context with Subagent

Use the Task tool with a subagent to gather all context in parallel:

**Subagent instructions:**

1. Get current branch: `git rev-parse --abbrev-ref HEAD`
2. Check git status: `git status`
3. Get commit history: `git log origin/main..HEAD --oneline`
4. Get file statistics: `git diff origin/main...HEAD --stat`
5. Get full diff: `git diff origin/main...HEAD`
6. For the most important changed files (top 3-5 by change size), read their contents to understand context
7. Return analysis including:
   - List of changed files with descriptions
   - Summary of what problem is being solved
   - Technical changes made
   - Any UI/visual changes detected

**Critical analysis requirements:**

- Understand what problem is being solved based on actual code changes
- Be specific about WHAT changed, not vague terms like "oppdatert"
- Include file paths when describing changes
- Detect any UI/visual component changes
- Identify new features vs bug fixes vs refactoring

### Step 4: Generate English PR Title

Based on the commits and changes, generate a clear PR title in English. Use the format:

- For features: "feat: [description]"
- For fixes: "fix: [description]"
- Example: "feat: Add feedback trend comparison chart" or "fix: Correct date filtering in feedback table"

### Step 5: Generate Norwegian PR Description

**If updating existing PR:**

- Extract the existing "## Visuelle endringer" section from the current PR body
- Preserve any images/content in that section

Create or update the PR description with these exact headings and format:

```markdown
## Hvorfor

[Explain the problem/need this PR addresses. Be specific based on actual changes.]
[If issue number provided: On new line: "Closes #XXX"]

## Beskrivelse av løsning

[Detailed explanation of what was changed, based on the diff analysis:]

- [Key change 1 with file reference]
- [Key change 2 with file reference]
- [Key change 3 with file reference]
  [Add technical details about implementation]

## Hvordan teste endringen

[Step-by-step testing instructions:]

1. [First step - how to navigate/access the feature]
2. [Second step - what to do]
3. [Expected result - what user should see/experience]

## Visuelle endringer

[If updating existing PR: Use the preserved section from the original PR. Otherwise: If UI changes detected from diff, describe them specifically. Otherwise: "Ingen visuelle endringer"]

---

🤖 Generert med [Claude Code](https://claude.com/claude-code)
```

### Step 6: Create or Update the PR

**If PR already exists:**

1. Save the body to a temporary file: `cat > /tmp/pr_body.md << 'EOF'\n[GENERATED_DESCRIPTION]\nEOF`
2. Update the PR title using GitHub API: `gh api repos/Medbric/dashboard/pulls/[pr-number] -X PATCH -f title="[TITLE]"`
3. Update the PR body using GitHub API: `gh api repos/Medbric/dashboard/pulls/[pr-number] -X PATCH --field body="$(cat /tmp/pr_body.md)"`
4. Get the PR URL from: `gh pr view [pr-number] --json url`

**IMPORTANT**: Do NOT use `gh pr edit` as it fails with GraphQL errors about "Projects (classic) is being deprecated". Always use `gh api` with PATCH requests instead.

**If no PR exists:**

1. Check if branch is already pushed: `git push -u origin HEAD` (if needed)
2. Create PR with: `gh pr create --title "[TITLE]" --body "[GENERATED_DESCRIPTION]" --base main`
3. Capture the PR URL from the output

### Step 7: Output Result

Show user:

**If created:**

```
✅ PR opprettet!

**PR URL**: [full URL]
**Tittel**: [PR title]
**Linked issue**: [#XXX or "Ingen"]
**Branch**: [branch-name]
```

**If updated:**

```
✅ PR oppdatert!

**PR URL**: [full URL]
**Tittel**: [PR title]
**Linked issue**: [#XXX or "Ingen"]
**Branch**: [branch-name]
**Endringer**: Beskrivelse og test-instruksjoner oppdatert. Visuelle endringer bevart.
```

### Guidelines

- Write everything in Norwegian
- Be specific and concrete based on actual diff analysis
- Don't use vague terms like "oppdatert", "forbedret", or "diverse endringer"
- Include file paths when describing changes
- For UI changes, be specific about what changed visually
- If no issue number provided, omit the "Closes #XXX" line
- Use subagent for thorough context gathering
- Analyze actual code diffs, don't make assumptions
- **When updating existing PR**: Always preserve the "Visuelle endringer" section with all images intact

### Error Handling

- If there are no changes compared to main: "Ingen endringer funnet på branchen"
- If branch is not pushed: Automatically push with `git push -u origin HEAD`
- If PR creation/update fails: Show the error message to user
- If multiple PRs exist on branch: Use the most recent one
