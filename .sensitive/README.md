# .sensitive/

This folder is **gitignored**. Files here will never be committed to the repository.

## What goes here

- Raw private documents (financial records, contracts, health data, client files, etc.)
- Anything with PII or commercially sensitive content
- API keys or credentials (though prefer a proper secret manager)
- Drafts of things you don't want in your git history

## How Ion uses it

Ion **may read** files here to inform its analysis. Ion will **never copy** specific values from `.sensitive/` into committed knowledge files — only synthesized insights, abstracted patterns, and conclusions.

For example: Ion might read a sensitive financial spreadsheet and write `"runway is approximately 8 months at current burn"` into `knowledge/financials/runway.md`, but it will never write the exact account balance.

## Why this exists

The knowledge base is git-tracked. Anything you commit lives forever, possibly publicly. `.sensitive/` is the escape valve — a place to keep raw data Ion can reference without risking leakage.

## Note

This README itself is **not** sensitive — it's committed so future-you understands the convention. The folder pattern (`/.sensitive/`) is matched in `.gitignore`, which means everything else inside is excluded.
