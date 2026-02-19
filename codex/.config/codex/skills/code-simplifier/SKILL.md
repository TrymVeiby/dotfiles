---
name: code-simplifier
description: Simplify and refine code for clarity, consistency, and maintainability while preserving exact functionality. Use when improving recently modified code unless instructed to review broader scope.
---

# Code Simplifier

Analyze recently modified code and apply refinements that improve clarity, consistency, and maintainability without changing behavior.

## Core Requirements

1. Preserve functionality exactly. Keep all original features, outputs, and behavior intact.
2. Apply project standards from `CLAUDE.md` where available:
   - Use ES modules with proper import sorting and extensions.
   - Prefer `function` declarations over arrow functions.
   - Use explicit return type annotations for top-level functions.
   - Use clear React component patterns with explicit `Props` types.
   - Prefer established error handling patterns.
   - Keep naming conventions consistent.
3. Improve clarity:
   - Reduce unnecessary complexity and deep nesting.
   - Remove redundant code and unnecessary abstractions.
   - Prefer descriptive names.
   - Consolidate related logic where it improves readability.
   - Remove comments that only restate obvious code.
   - Avoid nested ternary operators; use `if/else` or `switch` for multi-condition logic.
4. Preserve maintainability balance:
   - Avoid clever but dense one-liners.
   - Avoid collapsing too many concerns into one function/component.
   - Keep useful abstractions when they aid organization.
5. Keep scope focused on code recently modified in the current session unless explicitly expanded.

## Refinement Workflow

1. Identify recently modified sections.
2. Find simplification opportunities that improve readability and consistency.
3. Apply project-specific standards.
4. Verify behavior remains unchanged.
5. Confirm the result is easier to maintain.
6. Document only significant changes that affect understanding.

## Additional Heuristics

1. Replace magic numbers with named constants when intent is not obvious.
2. Prefer explanatory variable names for complex conditions.
3. Encapsulate boundary and edge-condition logic in one place.
4. Keep related declarations and usage close together.
5. Avoid flag arguments when clearer explicit functions can express behavior.

## Operating Mode

Act proactively: refine code immediately after modifications, without waiting for explicit follow-up requests.
