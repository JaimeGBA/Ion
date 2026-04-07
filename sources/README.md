# sources/

This is where **raw reference material** lives — articles, papers, transcripts, book excerpts, podcasts, reports, screenshots, anything you've encountered in the world and want Ion to integrate into your knowledge base.

## How this folder works

- **Immutable.** Ion reads from here but never modifies these files. They're your source of truth for things you didn't write.
- **Committed by default.** Sources go into git with everything else, so the integration trail is auditable. If a source is too large or too sensitive to commit, gitignore it or move it to `.sensitive/`.
- **Organized however you want.** Flat, by type, by topic, by date — Ion doesn't care. Suggested starting structure if you want one:

  ```
  sources/
  ├── articles/        Web articles, blog posts, news
  ├── papers/          Academic papers, whitepapers
  ├── transcripts/     Meeting transcripts, podcast transcripts, interviews
  ├── books/           Book excerpts and chapter notes
  └── reports/         Industry reports, financial documents, official filings
  ```

## How sources become knowledge

This folder is the input side of the `/ingest` skill.

When you add a source, run `/ingest <path>` (or just tell Ion: *"ingest this article"* and pass it the path). Ion will:

1. Read the source
2. Extract key claims, entities, and concepts
3. Update the relevant files in `knowledge/` to integrate the new information
4. Note any contradictions with existing knowledge
5. Update the relevant folder READMEs (`## Current Contents`)
6. Append an entry to `ops/changelog.md` with the parseable `ingest` action

A single source might touch 10-15 knowledge files. That's the point — the wiki compounds.

## Sources vs `.sensitive/`

These two folders look similar but serve different purposes:

| `sources/` | `.sensitive/` |
|---|---|
| Reference material from outside (you didn't write it) | Private data Ion shouldn't leak |
| Committed to git | Gitignored — never enters the repo |
| Ion reads, summarizes, and integrates verbatim | Ion reads but synthesizes only — never copies values |
| Articles, papers, transcripts, books | Financial records, contracts, PII, credentials |

If something is *both* (e.g., a confidential client interview transcript), put it in `.sensitive/`. Privacy wins over reference utility.

## Note on attachments

If you save articles via the [Obsidian Web Clipper](https://obsidian.md/clipper), point its attachment folder at `sources/assets/` so images get downloaded locally. Ion can then view them when needed instead of relying on URLs that may rot.
