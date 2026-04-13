---
description: Debug lane from symptoms to root cause and the smallest fix
agent: orchestrator
---

Treat `$ARGUMENTS` as the bug report or problem to investigate.

Run the `debug` lane.

Workflow:
1. Summarize symptoms, expected vs actual behavior, and regression signal if present.
2. Use `@discovery` to find entry points, suspect files, repro steps, and related tests.
3. Formulate one primary hypothesis with evidence and a falsification check.
4. Define the smallest possible fix with exact files and validation.
5. If the risk is non-trivial, pass the plan through `@reviewer`.
6. Ask for brief confirmation before editing.
7. Execute the fix with `@builder`.
8. Close by confirming what was fixed, what was validated, and what remains uncertain.

Prioritize evidence over intuition and avoid unrelated cleanup.
