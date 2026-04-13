---
description: Full feature lane with discovery, planning, review, and track-based execution
agent: orchestrator
---

Treat `$ARGUMENTS` as the user's request for this repo.

Run the `feature` lane.

Workflow:
1. Define the goal, scope, and acceptance criteria.
2. Use `@discovery` to map the current state, edit points, risks, and validation.
3. Use `@planner` to propose the implementation approach.
4. Use `@feature-manager` to break that approach into concrete tracks.
5. Pass the plan through `@reviewer` to detect gaps, edge cases, and avoidable risks.
6. Present the reviewed version and ask for confirmation before editing.
7. Execute each track with `@builder` without mixing tasks.
8. If a release summary or commit/PR proposal is useful, use `@shipper` at the end.
9. Close with changes made, validation, residual risks, and obvious next steps.

Do not collapse separate tracks into one execution if that increases risk.
