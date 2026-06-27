#!/usr/bin/env bash
set -euo pipefail

SOURCE_REPO="${SOURCE_REPO:-https://github.com/Boom5426/Nature-Paper-Skills.git}"
SOURCE_REF="${SOURCE_REF:-main}"
TARGET_DIR="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
WORK_DIR="${TMPDIR:-/tmp}/nature-paper-skills-install"

SKILLS=(
  "skills/core/paper-workflow"
  "skills/core/paper-bootstrap"
  "skills/core/scientific-writing"
  "skills/core/manuscript-optimizer"
  "skills/core/results-section-revision"
  "skills/core/figure-planner"
  "skills/core/citation-verifier"
  "skills/core/data-availability"
  "skills/core/submission-audit"
  "skills/core/rebuttal-response"
  "skills/venue/nature-portfolio-playbook"
)

echo "Installing Nature Paper Skills"
echo "Source: ${SOURCE_REPO} (${SOURCE_REF})"
echo "Target: ${TARGET_DIR}"

rm -rf "${WORK_DIR}"
git clone --depth 1 --branch "${SOURCE_REF}" "${SOURCE_REPO}" "${WORK_DIR}"

mkdir -p "${TARGET_DIR}"

for skill_path in "${SKILLS[@]}"; do
  skill_name="$(basename "${skill_path}")"
  src="${WORK_DIR}/${skill_path}"
  dst="${TARGET_DIR}/${skill_name}"

  if [[ ! -f "${src}/SKILL.md" ]]; then
    echo "Missing SKILL.md in ${src}" >&2
    exit 1
  fi

  rm -rf "${dst}"
  cp -R "${src}" "${dst}"
  echo "Installed ${skill_name}"
done

echo
echo "Installed skills:"
for skill_path in "${SKILLS[@]}"; do
  skill_name="$(basename "${skill_path}")"
  if [[ -f "${TARGET_DIR}/${skill_name}/SKILL.md" ]]; then
    echo "  - ${skill_name}"
  fi
done

echo
echo "Done. In Codex, start with:"
echo "用 paper-workflow 帮我判断这篇稿子下一步该用哪个 skill。"
