# Installing Ion

Ion installs itself by cloning into any empty directory you choose, initializing a fresh git repository, and walking you through a first-run conversation.

## Step 1: Pick a directory

Create an empty directory anywhere on your machine. This is where your knowledge base will live forever.

```bash
mkdir ~/my-knowledge
cd ~/my-knowledge
```

## Step 2: Open Claude Code in that directory

```bash
claude
```

(If you don't have Claude Code installed, get it from https://claude.com/claude-code)

## Step 3: Paste this prompt

Copy everything between the dashed lines and paste it as your first message:

---

```
I want to set up Ion, my AI knowledge keeper. Please do the following, in order:

1. Clone the Ion repository into the current directory:
   git clone https://github.com/JaimeGBA/Ion.git ion-tmp
   Then move all of its contents (including hidden files like .gitignore, .claude, .sensitive) into the current directory and remove the now-empty ion-tmp folder.

2. Remove the cloned .git directory and initialize a fresh git repository for MY knowledge base:
   rm -rf .git
   git init
   git add .
   git commit -m "ion: initial knowledge base from template"

3. Read the following files in order so you understand who you now are:
   - CLAUDE.md
   - ion/identity.md
   - ion/methodology.md

4. You are now Ion. Greet me in 2-3 sentences and immediately run the /bootstrap skill. That conversation will help me decide what you will be the keeper of and provision the appropriate knowledge structure.

5. After /bootstrap is complete, suggest I run /interview for the deeper knowledge capture session — but let me decide whether to do it now or later.

Begin.
```

---

## Step 4: That's it

Ion will take it from there. It will:

1. Pull itself down from GitHub
2. Make a fresh git repo for your knowledge base
3. Read its own identity and methodology
4. Greet you
5. Run the `/bootstrap` conversation to decide what mode to operate in
6. Provision your knowledge structure
7. Wait for you to run `/interview` whenever you're ready

If anything goes wrong during installation, Ion can self-repair — just tell it what you see.

## After installation

You'll want to set up a remote git host (GitHub, GitLab, etc.) so your knowledge base is backed up. Ion uses standard git, so any provider works:

```bash
gh repo create my-knowledge --private --source=. --remote=origin --push
```

Or do it manually through your provider's web UI.

Once a remote exists, the auto-sync hooks will keep everything in sync across machines.

---

## Troubleshooting

**"Ion didn't run /bootstrap automatically"** — Just type `/bootstrap` and it will start.

**"The hooks aren't running"** — Check that `.claude/settings.json` exists and that the scripts in `hooks/` are executable (`chmod +x hooks/*.sh`).

**"I want to start over"** — Delete the directory and start again. Your knowledge base is just files; nothing is hidden anywhere else.

**"Can I have multiple Ion installations?"** — Yes. Each directory is independent. You could have one Ion for your company, one for personal life, one for a novel — each in its own directory and git repo.
