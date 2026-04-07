---
title: Changelog
description: Append-only log of every change made to knowledge files
last_updated: 2026-04-06
updated_by: system
status: active
---

# Changelog

> Append-only. Ion writes here after every knowledge modification using a parseable format.
>
> Format: `## [YYYY-MM-DD] <action> | <subject>` followed by a one-line reason and `— by: <name>`.
>
> Greppable: `grep "^## \[" ops/changelog.md | tail -10`

## [2026-04-06] created | ion/state.md
Initial template scaffold from /bootstrap.
— by: system

## [2026-04-07] bootstrap | ops/inbox/, sources/
v1.1 additions: source ingestion layer, frictionless capture inbox, parseable log format, custom skill creation.
— by: ion
