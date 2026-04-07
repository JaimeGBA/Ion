# knowledge/

This is where your institutional memory lives.

This folder is intentionally empty until you run `/bootstrap`. That conversation will ask Ion what you want it to be the keeper of — company, personal life, creative project, research, or something custom — and provision the appropriate subdirectory structure for the mode you choose.

After bootstrap, the structure looks roughly like:

- **Company mode**: `strategy/`, `product/`, `customers/`, `financials/`, `legal/`, `team/`, `intelligence/`, `decisions/`, `meetings/`
- **Personal mode**: `identity/`, `goals/`, `health/`, `finances/`, `relationships/`, `projects/`, `learning/`, `decisions/`, `journal/`
- **Creative mode**: `premise/`, `worldbuilding/`, `characters/`, `plot/`, `research/`, `drafts/`, `feedback/`, `decisions/`
- **Research mode**: `topics/`, `sources/`, `experiments/`, `findings/`, `collaborators/`, `drafts/`, `decisions/`, `meetings/`

Two folders are universal across all modes:
- **`decisions/`** — append-only decision log. Each file: `YYYY-MM-DD-decision-title.md`. Never edit after creation.
- **`meetings/`** or **`journal/`** — append-only entries. Same naming convention.

Every file in `knowledge/` should:
- Start with YAML frontmatter (`title`, `description`, `last_updated`, `updated_by`, `status`)
- Use `[[wiki links]]` to reference related files
- Stay atomic (one topic per file)
- Date time-sensitive claims

See `ion/methodology.md` for the full conventions.
