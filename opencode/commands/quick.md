---
description: Quick lane for small isolated changes
agent: orchestrator
---

Treat `$ARGUMENTS` as the user's request for this repo.

Run the `quick` lane.

Workflow:
1. Confirm that the request is small, local, and low risk.
2. If context is missing, delegate a short discovery pass to `@discovery`.
3. Propose a minimal plan: objective, files, constraints, and validation.
4. Ask for brief final confirmation before editing if the change is not completely obvious.
5. Delegate exactly one track to `@builder`.
6. Close with changed files, checks run, and residual risk.

If you discover the work is larger, recommend `/medium`, `/feature`, or `/debug` instead of forcing it through this lane.
