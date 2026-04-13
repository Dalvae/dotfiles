---
description: Medium lane for multi-file changes without overdesign
agent: orchestrator
---

Treat `$ARGUMENTS` as the user's request for this repo.

Run the `medium` lane.

Workflow:
1. Clarify only what materially changes scope or acceptance criteria.
2. Use `@discovery` to map files, patterns, and validation.
3. Use `@planner` to produce the approach and clear boundaries.
4. Use `@feature-manager` to convert that approach into executable tracks.
5. If the risk is real, pass the plan through `@reviewer`.
6. Present the final plan and ask for brief confirmation before editing.
7. Execute the tracks in order with `@builder`, one at a time.
8. Close with a technical summary, validations, and useful follow-ups.

Keep the process lighter than `/feature` and more structured than `/quick`.
