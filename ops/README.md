# ops/

The operational workspace. Things Ion needs that aren't part of the knowledge graph itself.

## Files and folders

- **`changelog.md`** — parseable, append-only log of every change Ion makes to knowledge files. Format: `## [YYYY-MM-DD] action | subject`. See `methodology.md` for the full convention.
- **`action-items.md`** — living checklist of open tasks across you and your collaborators. Ion adds items as they come up in conversation and marks them done when you tell it they're complete.
- **`inbox/`** — frictionless captures from `/capture` (and `/ideate` sessions). Items here are awaiting `/process-inbox`. See `inbox/README.md` for the full convention.
- **`reviews/`** — output of `/review` and `/health` skill runs. One file per review, dated.

This folder is committed to git but not part of the formal knowledge base. Treat it as the workshop, not the gallery.
