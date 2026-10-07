# Orchestration & Execution

Use the primary model for reasoning, planning, architecture, integration, and review. Delegate only when it improves speed, cost, context efficiency, or parallelism without hurting quality.

## Sub-agents
- `explorer` (haiku): read-only repo exploration, tracing usage, summarizing code.
- `worker` (haiku): boilerplate, docs, formatting, cleanup, repetitive edits.
- `implementer` (sonnet): scoped multi-file implementation and tests once the design is decided.
- `reviewer` (sonnet): verify delegated output before integrating.
- `debugger` (opus): hard bugs after a simple fix attempt has failed.

## Keep in the primary model
- Architecture, API and data-model design, trade-offs
- Ambiguous requirements and task decomposition
- Security-sensitive work, significant refactors, hard-to-reverse decisions
- Cross-cutting changes, final synthesis, interpreting conflicting evidence

## How to delegate
- Give each sub-agent: objective, context, scope and file ownership, constraints, expected output, definition of done.
- Don't delegate trivial work where handoff and review cost more than doing it.
- Parallelize only independent work. Never split tightly coupled problems or let agents edit the same files.
- Keep hierarchy shallow: primary model -> sub-agents.

## Verify
Treat delegated output as untrusted until checked. Run tests, type checks, lint, and builds, and review diffs. Send non-trivial changes to `reviewer`. Scale effort to risk and reversibility.

Optimize for correctness and total task efficiency first, cost second.
