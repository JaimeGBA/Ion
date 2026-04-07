# ops/inbox/

Frictionless capture zone. **Dump first, organize later.**

## What goes here

Anything you want to remember but don't want to think about *where it belongs* right now. A 2am idea. A shower thought. A half-formed insight from a meeting. A link to look at later. A name you want to remember.

The inbox is meant to be **fast**. Use the `/capture` skill (or just say "capture this" to Ion) and your thought lands in `ops/inbox/YYYY-MM-DD-HHMMSS-<brief-title>.md` with no friction.

## File format

Each inbox file is a simple capture:

```yaml
---
title: brief title (auto-generated from content if not specified)
captured: YYYY-MM-DD HH:MM:SS
status: inbox
---

The content of the thought, exactly as captured. Ion won't reformat this until /process-inbox runs.
```

That's it. No required wiki links. No required structure. No frontmatter ceremony beyond date and status.

## Processing the inbox

When the inbox accumulates, run `/process-inbox`. Ion walks through each item and:

- **Confident matches** → auto-files into the right `knowledge/` location, following the three-tier model
- **Ambiguous items** → asks you where it should go
- **Items that don't fit anywhere** → either creates a new knowledge file or asks if you want to delete

After processing, the inbox file is either:
- **Integrated** — its content has been merged into a knowledge file, and the inbox file is deleted
- **Promoted** — its content becomes its own knowledge file, with the inbox file deleted
- **Archived** — moved to `ops/inbox/processed/` if there's value in keeping the raw form

## Inbox health

`/health` flags inbox depth. The general rule:

- **< 10 items, < 14 days** → healthy
- **10-25 items or 14-30 days** → warning, schedule a `/process-inbox` session
- **> 25 items or > 30 days** → the inbox is becoming a graveyard, process now

The inbox is a way-station, not a permanent file cabinet.

## Inbox vs sources/

These are different capture mechanisms:

| `ops/inbox/` (`/capture`) | `sources/` (`/ingest`) |
|---|---|
| Your own thoughts, fast | External documents you found |
| Unstructured, no ceremony | Original source material kept intact |
| Processed by `/process-inbox` later | Digested by `/ingest` into the knowledge base |
| Frictionless brain dumps | Deliberate integration of outside material |

Use `/capture` when *you* had a thought. Use `/ingest` when you found something *out there*.
