# Nature Paper Skills installation

This repository contains a helper installer for the Nature Paper Skills stack from:

- Source repository: https://github.com/Boom5426/Nature-Paper-Skills
- Upstream default branch: `main`
- Intended Codex global target: `~/.codex/skills/`

## What gets installed

The installer copies the recommended Codex stack:

- `paper-workflow`
- `paper-bootstrap`
- `scientific-writing`
- `manuscript-optimizer`
- `results-section-revision`
- `figure-planner`
- `citation-verifier`
- `data-availability`
- `submission-audit`
- `rebuttal-response`
- `nature-portfolio-playbook`

## Install

From this repository:

```bash
bash scripts/install_nature_paper_skills.sh
```

By default, skills are installed to:

```bash
~/.codex/skills/
```

Override the target directory with:

```bash
CODEX_SKILLS_DIR=/path/to/skills bash scripts/install_nature_paper_skills.sh
```

## After installation

Ask Codex:

```text
用 paper-workflow 帮我判断这篇稿子下一步该用哪个 skill。
```

## Limitation

GitHub repository changes cannot write directly into the local `~/.codex/skills/` directory of your machine or Codex runtime. This branch therefore adds a repeatable installer and a lightweight repo-local router. Run the installer in the environment where Codex should load the skills.
