# Ion

> A persistent AI keeper of knowledge for whatever matters to you.

Ion is an opinionated framework for building a long-lived knowledge base that an AI partner can hold, maintain, and reason over. It runs on top of [Claude Code](https://claude.com/claude-code), is stored as plain markdown in a git repository, and is yours forever.

It works for any domain — a startup, a personal life, a creative project, a research program — and was originally built by [Jaime Gómez Arreche](https://github.com/JaimeGBA) as the keeper of knowledge for his startup [Parametric](https://parametric.ai).

---

## Why Ion exists

Most "AI knowledge tools" do one of two things:

1. **Index your existing files** (Notion AI, ChatGPT projects). The AI is a search bar with a personality. It doesn't *think* about your knowledge.
2. **Hold context in a chat session**. When the chat ends, the context dies. Tomorrow's conversation starts from scratch.

Neither is what you actually want. What you want is a partner who **remembers**, **organizes**, **challenges**, and **evolves** with you over years — not minutes.

Ion is an attempt at that. The trick is that it's not software at all. It's:

- A **methodology** for how knowledge should be structured (atomic, dated, wiki-linked, status-tagged)
- An **identity** for the AI that holds it (a peer, not an assistant — direct, opinionated, loyal)
- A **set of skills** the AI runs to interview you, brief you, review your knowledge, and challenge your thinking
- A **git repository** that makes everything auditable, version-controlled, and yours

Claude Code is just the runtime. The intelligence lives in the markdown.

---

## What you get

Once installed, you have a knowledge keeper named **Ion** that can:

- `/bootstrap` — figure out what you want it to keep (company, personal, creative, research, custom) and provision the right structure
- `/interview` — extract knowledge from you in a conversational, area-by-area way
- `/brief` — give you a one-page status report on where things stand
- `/review` — deep-review any area of your knowledge for gaps, contradictions, and staleness
- `/health` — comprehensive structural and content health check
- `/decide` — walk you through a structured decision and document it forever
- `/ideate` — switch into brainstorming mode, push back on your assumptions

Plus two sub-agents:
- **Librarian** — hunts for contradictions, broken links, stale files, and structural issues
- **Strategist** — does deep analytical work on plans, finds holes, surfaces opportunities

Plus shell hooks that auto-pull from git at session start, validate frontmatter on save, and auto-commit knowledge changes.

---

## Install

Ion is designed to be installed inside any empty directory you want your knowledge base to live in. Open a fresh Claude Code session in that directory and paste the prompt from [`BOOTSTRAP.md`](./BOOTSTRAP.md). Ion will clone itself, initialize a fresh git repo, and walk you through onboarding.

That's the entire installation process.

---

## The opinionated parts

These are the design choices that make Ion different from "ChatGPT with a folder":

1. **Three-tier knowledge updates.** Ion classifies every change as auto-update (new info), propose-then-update (changes existing knowledge), or ask-first (destructive). This prevents drift and gaslighting.
2. **Wiki links as first-class citizens.** Every connection between ideas is `[[an explicit link]]`. Your knowledge base is a graph, not a folder. View it in Obsidian if you want.
3. **Append-only decisions and meetings.** Once written, never edited. If a decision is reversed, write a new decision that supersedes it. History is preserved.
4. **Mandatory `why`.** Every decision and strategy must include the reasoning, not just the conclusion. Future-you (and Ion) will need it.
5. **`.sensitive/` escape valve.** A gitignored folder Ion can read but never copy values from. Synthesize, don't leak.
6. **Ion is a partner, not an assistant.** It is loyal, direct, and opinionated. It will tell you when you're wrong. That's the point.

---

## Modes

Ion provisions a different folder taxonomy depending on what you're keeping:

| Mode | Folders |
|---|---|
| **Company / Startup** | strategy, product, customers, financials, legal, team, intelligence, decisions, meetings |
| **Personal Life** | identity, goals, health, finances, relationships, projects, learning, decisions, journal |
| **Creative Project** | premise, worldbuilding, characters, plot, research, drafts, feedback, decisions |
| **Research / Academic** | topics, sources, experiments, findings, collaborators, drafts, decisions, meetings |
| **Custom** | Whatever you and Ion design together |

The skills are mode-agnostic. Whatever taxonomy you pick, the same `/brief`, `/review`, `/health`, `/decide`, `/ideate` work.

---

## What Ion is NOT

- **Not a SaaS.** There is no server, no account, no subscription. Your knowledge lives on your machine and in your git remote.
- **Not a model.** Ion is configuration on top of Claude Code. The intelligence comes from Claude.
- **Not a turnkey app.** It's a framework for power users who are willing to engage with markdown and the command line.
- **Not a replacement for Notion / Obsidian / Roam.** It's complementary — you can view your Ion knowledge base in Obsidian and get a beautiful graph visualization for free.

---

## Credits

Ion was created by **Jaime Gómez Arreche** ([@JaimeGBA](https://github.com/JaimeGBA)), originally to serve as the keeper of knowledge for his startup [Parametric](https://parametric.ai).

If Ion is useful to you, the best thank-you is to:
1. ⭐ Star the repo
2. Share it with someone who would benefit
3. Open a PR if you have an improvement

Contributions are welcome. Ion is maintained because it's useful to its creator first — improvements that align with that usefulness are most likely to be merged.

---

## License

[MIT](./LICENSE) — © 2026 Jaime Gómez Arreche. Use it, fork it, sell what you build with it. Just don't strip the credit.
