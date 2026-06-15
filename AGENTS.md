# Agent Rules & Project Standards for awscli-aliases

## Repository Overview

awscli-aliases provides convenient aliases and shortcuts for AWS CLI operations.

## Code Standards and Practices

### Documentation Standards

- Include clear usage examples for each alias.
- Document AWS CLI version compatibility.
- Provide installation and configuration instructions.
- Use markdown formatting consistently.

### Markdown Compliance Requirements (MANDATORY)

- Run `markdownlint <filename>` on every markdown file before considering it complete
- Follow the project's `.markdownlint.json` configuration strictly
- Address ALL markdownlint issues immediately - no exceptions or workarounds
- Common requirements include:
  - Maximum line length of 80 characters (MD013) (overridden to 200 in .markdownlint.json)
  - Consistent heading styles and hierarchy
  - Proper list formatting and indentation
  - Blank lines around headings and code blocks
  - Consistent link and reference formatting
  - No trailing whitespace
  - Files must end with newlines
  - Proper table formatting when applicable
Use `markdownlint --fix <filename>` for auto-fixable issues when available
- Validate markdown files in CI/CD pipelines where applicable
- Run `markdownlint --config .markdownlint.json "**/*.md"` to lint all markdown files in the repository

### Commit Message Convention

- Use the conventional commit format: `type(scope): description`
- Common types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`, `ci`
- Commit descriptions should be a bullet list of changes made
- Example:

  ```text
  docs(AGENTS.md): update agent rules for cloudflare-worker project

  - this file had the wrong data from a totally different repository
  ```

#### Commit Types

- **feat**: A new feature
- **fix**: A bug fix
- **alias**: A new or updated alias
- **docs**: Documentation only changes
- **style**: Formatting (white-space, etc)
- **refactor**: Code change that neither fixes a bug nor adds a feature
- **perf**: Performance improvement
- **test**: Adding or correcting tests
- **chore**: Changes to build process or auxiliary tools

#### Scope Guidelines

- **action**: main action logic
- **docs**: documentation
- **tests**: test-related
- **ci**: CI/CD configuration
- **deps**: dependency updates

## Development Guidelines

### When Making Changes

- Preserve existing functionality unless explicitly asked to change it
- Update documentation when adding new aliases
- **Always run markdownlint and fix all issues in markdown files before considering changes complete**

### AWS CLI Standards

- Test aliases across different AWS CLI versions.
- Use proper error handling for AWS API calls.
- Document required AWS permissions for each alias.
- Implement safe operations that don't accidentally modify resources without confirmation.

## GitHub & Automation Standards

These rules apply specifically to files in `.github/*` (workflows, templates, and documentation).

### Quality Gates (MANDATORY)

Before completing any change in `.github/`:

1. ✅ Run `markdownlint` validation (if .md file).
2. ✅ Ensure project standards are followed.
3. ✅ Verify contribution guidelines are up-to-date.
4. ✅ Check that automation maintains project standards.

### Templates and Workflows

- Ensure issue and pull request templates provide clear, actionable guidelines.
- Include project-specific troubleshooting sections in templates.
- Reference existing project documentation and standards.

### Documentation standards in .github/

- `.github/CONTRIBUTING.md` must include:
  - AWS CLI installation and configuration instructions.
  - Alias testing procedures.
  - Documentation of alias purposes and use cases.
  - Compatibility testing across AWS CLI versions.

### Automation and CI/CD

- Project workflows must include automated testing stages.
- Code quality checks must be integrated into CI/CD.
- Release automation must be properly configured.

### Error Prevention

- NEVER generate markdown that violates line length or formatting rules.
- ALWAYS cross-reference with existing project practices before making changes.
- ENSURE all links and references are valid and current.
- VALIDATE that new requirements don't conflict with established workflows.
