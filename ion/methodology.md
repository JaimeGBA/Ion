---
title: Knowledge Management Methodology
description: How Ion manages the knowledge base — update rules, tiers, file conventions, quality standards
last_updated: 2026-04-06
updated_by: system
status: active
---

# Knowledge Management Methodology

## The Knowledge Delta Mindset

During every conversation, continuously evaluate: "Did I just learn something the knowledge base doesn't already know?"

Information falls into one of four categories:
1. **New knowledge** — not yet documented → update
2. **Refined knowledge** — extends existing docs without contradicting → update
3. **Changed knowledge** — contradicts or supersedes existing docs → propose change
4. **Known knowledge** — already accurately documented → no action needed

## Three-Tier Update Model

### Tier 1: Auto-Update

**When:** New information that adds to (not contradicts) existing knowledge.

**Examples:** New meeting notes, progress updates, feedback received, action items, new contacts, factual additions.

**Behavior:** Update immediately. Mention changes at end of session.

### Tier 2: Propose-Then-Update

**When:** Information that would change, replace, or contradict existing knowledge.

**Examples:** Revised strategy, changed priorities, updated projections, a pivot, contradicting a previous decision, reframed positioning, abandoned goals.

**Behavior:** Show what you would change and why. Wait for explicit approval. Any affirmative response ("yes", "do it", "sounds right", "go ahead") is sufficient.

### Tier 3: Ask-First

**When:** Destructive changes or high-stakes modifications.

**Examples:** Deleting any knowledge file, modifying legal/compliance information, overwriting decision records, anything involving `.sensitive/` data, changing Ion's own methodology or identity.

**Behavior:** Explain what you want to do and the consequences. Wait for explicit confirmation.

## File Conventions

### YAML Frontmatter (Required on all knowledge files)

```yaml
---
title: Human-readable title
description: One-line description — add information beyond the title (this aids retrieval)
last_updated: YYYY-MM-DD
updated_by: ion | <partner's name>
status: skeleton | draft | active | stale | archived
---
```

### Naming Conventions

- Knowledge files: descriptive kebab-case (`vision.md`, `current-goals.md`)
- Decision files: `YYYY-MM-DD-decision-title.md` — append-only, NEVER edit after creation
- Meeting / journal entries: `YYYY-MM-DD-topic.md` — append-only, NEVER edit after creation

### Content Standards

- Lead with the most important information
- Use headers (`##`) to structure sections
- Include "Why" context for decisions and strategies — not just what, but why
- Date time-sensitive claims: "As of [Month Year], the situation is X"

### Wiki Links (Knowledge Graph)

The knowledge base is a graph. Every connection between ideas should be an explicit `[[wiki link]]`:

- **Always use `[[file-name]]` syntax** when referencing another knowledge file (e.g., `[[vision]]`, `[[current-goals]]`)
- Use the file's base name without path or extension: `[[goals]]` not `[[knowledge/personal/goals.md]]`
- **Inline links over footer links** — embed links in context so the surrounding prose explains WHY the connection matters
- **Bidirectional awareness** — when adding a link from A to B, consider whether B should also link back to A
- Links are graph edges. The more meaningfully connected the files are, the more useful the knowledge base becomes — both for Ion's navigation and for visual graph exploration in tools like Obsidian
- Add a `## Related` section at the bottom of files for connections that don't fit naturally inline

### Folder Contents (Per-Folder Indexes)

Every knowledge subfolder contains a `README.md` that serves as a **local index**. Each README has two sections:

1. **What belongs here** — a short prose description of what the folder is for (set during `/bootstrap`, rarely changes)
2. **`## Current Contents`** — a maintained list of every file in the folder, each with a one-line description

Format for Current Contents entries:
```
- [[file-name]] — one-line summary of what this file covers
```

**When to update the folder README:**
- **Created a new knowledge file** → add a new line under `## Current Contents` in the parent folder's `README.md`
- **Significantly changed a file's scope or topic** → update its one-line description
- **Archived or deleted a file** → remove its entry (or move to an `## Archived` subsection if worth preserving)

This gives every knowledge area a fast, local table of contents without requiring a single top-level index that would become a write hotspot. Each folder README is the navigation anchor for that area. At scale, you never need to grep the whole knowledge base to know what exists — you just read the relevant folder README.

**Rule of thumb:** if you create a file, update its parent README in the same operation. The auto-sync hook will commit both together.

## State Management

### ion/state.md
Update when:
- A significant decision is made
- A major milestone is reached or missed
- The situation materially changes (new context, new commitment, new direction)

### ops/changelog.md

Append after every knowledge modification. Use a **parseable format** so the log can be scanned with simple tools:

```
## [YYYY-MM-DD] <action> | <subject>
<one-line reason or description>
— by: <name or ion>
```

Where `<action>` is one of: `created`, `updated`, `archived`, `ingest`, `review`, `health`, `decision`, `capture`, `process-inbox`, `bootstrap`.

The consistent prefix (`## [date] action |`) means the log is greppable:

```bash
grep "^## \[" ops/changelog.md | tail -10              # last 10 actions
grep "^## \[.*\] ingest" ops/changelog.md               # every ingest ever
grep "^## \[2026-04" ops/changelog.md                   # everything in April 2026
grep "^## \[.*\] decision" ops/changelog.md             # every decision logged
```

### ops/action-items.md
Living checklist:
```
- [ ] Description — **Owner: Name** — Due: YYYY-MM-DD — Source: [file reference]
- [x] Completed — **Owner: Name** — Completed: YYYY-MM-DD
```

## Source Ingestion (`sources/` and `/ingest`)

The `sources/` folder is for **raw reference material** — articles, papers, transcripts, book excerpts, reports, podcasts, anything you've read or watched and want Ion to integrate into the knowledge base.

- `sources/` is **immutable** — Ion reads from it but never modifies it
- Files in `sources/` should retain their original form: a copied article keeps its text, a PDF stays a PDF
- Organize `sources/` however makes sense for your context — by type (`articles/`, `papers/`, `transcripts/`), by topic, by date, or flat — the convention is up to your partner
- Sources are distinct from `.sensitive/`: `.sensitive/` is for private data Ion should never copy verbatim, while `sources/` is for reference material Ion should actively digest and integrate

**The `/ingest` skill** is how raw sources become knowledge. When your partner points Ion at a source, Ion reads it, extracts key claims and entities, updates relevant knowledge files, notes contradictions with existing knowledge, and logs the ingest in `ops/changelog.md`. A single ingest may touch many knowledge files — that's expected and desirable. The compounding is the whole point.

## Inbox Workflow (`ops/inbox/`, `/capture`, `/process-inbox`)

There are two modes of capture, and Ion supports both:

**Deliberate capture** — your partner knows where a thought belongs and writes (or asks Ion to write) directly to the appropriate file in `knowledge/`. This is the default path for conversation-driven updates; the three-tier model applies.

**Frictionless capture** — your partner has a thought but doesn't want to decide *where* it goes. They use `/capture`, which drops the thought into `ops/inbox/YYYY-MM-DD-HHMMSS-<brief-title>.md` with minimal ceremony. No routing logic, no mode questions — just "catch it before it's gone."

**Processing the inbox** — when the inbox has accumulated (usually during review sessions), `/process-inbox` walks through each item and files it into the right place in `knowledge/`. Ion proposes destinations, auto-files confident matches per the three-tier model, and asks about ambiguous ones. Processed items are either moved into `knowledge/` (by rewriting the content with proper frontmatter and wiki links) or deleted from the inbox once their content has been integrated.

**Inbox health** — `/health` tracks inbox depth. If more than ~10 items sit unprocessed for more than ~14 days, it flags this as a warning. The inbox is a way-station, not a permanent file cabinet.

## Quality Standards

### What Makes Good Knowledge
- **Atomic**: one topic per file — don't mix concerns
- **Current**: dated claims, marked stale when outdated
- **Actionable**: knowledge should inform decisions, not just exist
- **Honest**: document uncertainties, assumptions, and risks alongside plans

### What NOT to Store in Knowledge Files
- Raw private data (goes in `.sensitive/`, never committed)
- Source code (lives in its own repository)
- Ephemeral conversation context (use conversation, not files)
- Easily Googled facts (store your interpretation and how it applies, not the raw fact)
