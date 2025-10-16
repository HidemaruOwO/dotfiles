---
description: Commit changes with pummit CLI tools using emoji-based commit messages
agent: build
---

# Commit with pummit

This command classifies changed files into logical groups and runs commits using pummit with appropriate emoji-based messages.

## Process Flow

1. **Fetch Changed Files**
   - Run `git status --short` to get current changes
   - If no changes, notify "No changes to commit" and exit

2. **Classify Files**
   - Categorize based on file path, extension, and change content
   - If multiple categories apply, select the most impactful one

3. **Generate Commit Commands**
   - Create combined `git add` and `pummit` commands for each group
   - Run command

## Classification Logic and Alias Mapping

| Category      | Alias            | Detection Criteria                                         |
| ------------- | ---------------- | ---------------------------------------------------------- |
| Feature       | `sparkles`       | New file additions, new feature implementations            |
| Bug Fix       | `bug`            | Filenames containing `fix`, `bug`, existing code fixes     |
| Refactoring   | `recycle`        | Code cleanup, structural changes (no functionality change) |
| Documentation | `books`          | `.md`, `.txt`, `README`, files under `docs/`               |
| Configuration | `wrench`         | Config files (`.json`, `.yaml`, `.toml`, `.config.*`)      |
| Tests         | `rotating_light` | `test/`, `tests/`, `*_test.*`, `*.test.*`                  |
| Deletion      | `fire`           | File deletions only                                        |
| WIP           | `construction`   | Incomplete changes, heavy commenting                       |

## Commit Message Generation Rules

- **Concise English**: Start with imperative verb (Add, Fix, Update, Remove, etc.)
- **Specific**: Make changes immediately clear
- **Under 50 characters**: Keep subject line brief
- **Multiple files**: Group by common purpose

## Execution Examples

```bash
# Feature addition
git add src/new_feature.rs && pummit sparkles "Add user authentication feature"

# Bug fix
git add src/validator.rs && pummit bug "Fix boundary condition in input validation"

# Documentation update
git add README.md docs/setup.md && pummit books "Update installation and setup instructions"

# Configuration change
git add .opencode/settings.json && pummit wrench "Configure custom build settings"

# Refactoring
git add src/utils.rs src/helpers.rs && pummit recycle "Refactor utility functions for better readability"
```

## Important Notes

- **Grouping validity**: Point out any unnatural groupings
- **Sensitive data check**: Warn if passwords or API keys are detected
- **Large changes**: Suggest splitting if 10+ files changed

## Customization Options

Additional aliases available as needed:

- `tada` - Initial commit, major release
- `art` - UI or style improvements
- `zap` - Performance improvements
- `lock` - Security fixes
- `arrow_up` / `arrow_down` - Dependency upgrades/downgrades
- `package` - Package or dependency updates
- `green_heart` - CI/CD fixes
- `pencil` - Typo fixes
- `rewind` - Revert changes
