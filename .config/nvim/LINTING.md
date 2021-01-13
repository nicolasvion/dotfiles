# 🔍 Linting Configuration

Configuration to automatically validate Git commits and Markdown files.

---

## 📝 Markdownlint

### What is it for?

**Markdownlint** checks that your Markdown files follow best practices:
- ✅ Consistent header structure
- ✅ Line length (120 characters)
- ✅ List formatting
- ✅ Correct spacing
- ✅ No dangerous HTML

### Installation

```bash
# macOS
brew install markdownlint-cli

# npm (all platforms)
npm install -g markdownlint-cli

# Check installation
markdownlint --version
```

### Configuration

The [`.markdownlint.json`](.markdownlint.json) file contains the rules:

```json
{
  "MD013": {
    "line_length": 120,  // Max 120 characters per line
    "tables": false      // No limit for tables
  },
  "MD033": {
    "allowed_elements": ["br", "details", "summary", "kbd"]  // Allowed HTML
  }
}
```

### Usage in Neovim

**Automatic**: ALE checks your Markdown files on every save!

- `;an` : Next error
- `;ap` : Previous error
- Errors display directly in the file

### Command Line Usage

```bash
# Check a file
markdownlint README.md

# Check all Markdown files
markdownlint *.md

# Auto-fix
markdownlint --fix README.md
```

---

## 💬 Commitlint

### What is it for?

**Commitlint** validates that your commit messages follow the **Conventional Commits** format:

```
type(scope): subject

body

footer
```

**Good commit example**:
```
feat(auth): add login with OAuth2

Implement OAuth2 authentication flow with Google and GitHub providers.
Add tests for the new authentication methods.

Closes #123
```

### Allowed Commit Types

| Type | Description | Example |
|------|-------------|---------|
| `feat` | New feature | `feat: add user dashboard` |
| `fix` | Bug fix | `fix: resolve login issue` |
| `docs` | Documentation | `docs: update README` |
| `style` | Formatting | `style: fix indentation` |
| `refactor` | Refactoring | `refactor: simplify auth logic` |
| `perf` | Performance | `perf: optimize database queries` |
| `test` | Tests | `test: add unit tests for API` |
| `build` | Build system | `build: update dependencies` |
| `ci` | CI/CD | `ci: add GitHub Actions workflow` |
| `chore` | Maintenance | `chore: update .gitignore` |
| `revert` | Revert | `revert: undo previous commit` |
| `wip` | Work in progress | `wip: working on feature X` |

### Installation

```bash
# npm (all platforms)
npm install -g @commitlint/cli @commitlint/config-conventional

# Check installation
commitlint --version
```

### Configuration

The [`commitlint.config.js`](commitlint.config.js) file contains the rules:

```javascript
module.exports = {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'header-max-length': [2, 'always', 100],  // Max 100 characters
    'body-max-line-length': [2, 'always', 120],
  },
};
```

### Usage in Neovim

**Automatic**: ALE checks your commit messages when you edit `COMMIT_EDITMSG`!

Errors display if your message doesn't follow the format.

### Command Line Usage

```bash
# Check last commit
commitlint --from HEAD~1 --to HEAD --verbose

# Check a message
echo "feat: add new feature" | commitlint

# Check all commits in a branch
commitlint --from main --to HEAD
```

### Git Hooks Integration

To automatically validate **before** each commit:

```bash
# Install husky (hook manager)
npm install -g husky

# In your project
cd ~/work/your-project
npx husky init
echo "npx --no -- commitlint --edit \$1" > .husky/commit-msg
chmod +x .husky/commit-msg
```

Now Git will reject badly formatted commits! 🎉

---

## 🎯 Commit Message Examples

### ✅ Good Examples

```bash
feat: add user authentication
fix: resolve memory leak in parser
docs: update installation guide
refactor: simplify database queries
test: add unit tests for API endpoints
chore: update dependencies
```

### ❌ Bad Examples

```bash
Added new feature          # No type
FIX: bug                   # Type in uppercase
feat : add feature         # Space before :
feat: Add feature.         # Period at the end
feat: this is a very long commit message that exceeds the maximum allowed length  # Too long
```

### 📝 With Scope (optional)

```bash
feat(api): add REST endpoints
fix(ui): correct button alignment
docs(readme): add installation steps
test(auth): add OAuth tests
```

---

## 🚀 Recommended Workflow

### For Commits

1. Make your changes
2. `ga` - Add files
3. `gc` - Open commit editor
4. Write your message in format: `type: description`
5. ALE warns you if format is incorrect
6. Save and close

### For Markdown

1. Edit your `.md` file
2. ALE checks automatically
3. `;an` / `;ap` to navigate through errors
4. Fix issues
5. Save (auto-format with prettier)

---

## 🔧 Useful Commands

```vim
" In Neovim
:ALEInfo                    " View active linters
:ALEDetail                  " Current error details
:ALEFix                     " Force formatting
:ALEToggle                  " Enable/disable ALE

" Manual check
:!markdownlint %            " Check current Markdown file
:!commitlint --edit .git/COMMIT_EDITMSG  " Check last commit
```

---

## 📚 Resources

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Commitlint](https://commitlint.js.org/)
- [Markdownlint Rules](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md)
- [Markdownlint CLI](https://github.com/igorshubovych/markdownlint-cli)

---

**Configuration**: Neovim + ALE + Commitlint + Markdownlint
**Auto-validation**: ✅ Enabled
