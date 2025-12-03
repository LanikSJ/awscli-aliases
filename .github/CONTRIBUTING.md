# Contributing

## Welcome

We welcome contributions to AWS CLI Aliases! Whether you're fixing bugs,
adding new aliases, improving documentation, or enhancing scripts, your help
is appreciated.

Before contributing, please review this guide and ensure your changes align
with the project's goals of simplifying AWS CLI usage through helpful aliases.

## Ways to Contribute

- **Adding new aliases**: Create useful shortcuts for common AWS CLI commands
- **Improving existing aliases**: Fix issues or make them more efficient
- **Updating documentation**: Improve README, wiki, or other docs
- **Bug fixes**: Address issues in scripts or Docker configuration
- **Testing**: Help test changes and provide feedback

## Development Setup

1. Fork the repository
2. Clone your fork:

   ```bash
   git clone https://github.com/your-username/awscli-aliases.git
   ```

3. Set up the aliases locally for testing:

   ```bash
   ln -sf $(pwd)/alias ~/.aws/cli/alias
   ```

4. Test your changes with `aws --version` and your new/updated aliases

## Contributing Guidelines

- **Testing**: Always test your aliases with actual AWS CLI commands
- **Documentation**: Update the README.md and/or wiki if your changes affect usage
- **Style**: Follow the existing style in the `alias` file
- **Scope**: Keep aliases focused on AWS CLI functionality
- **Compatibility**: Ensure changes work with recent AWS CLI versions

## Pull Request Process

1. **Discuss first**: Open an issue to discuss significant changes before implementing
2. **Branch**: Create a feature branch from `main`
3. **Test thoroughly**: Ensure your changes work correctly and don't break existing functionality
4. **Update docs**: Modify README.md or wiki if the user-facing behavior changes
5. **Version**: If adding major new functionality, this may warrant a new release (following SemVer)
6. **Review**: The PR will be reviewed by maintainers. Address any feedback provided.
7. **Merge**: Once approved, a maintainer will merge your changes

## Code of Conduct

### Our Pledge

We as members, contributors, and leaders pledge to make participation in our
community a harassment-free experience for everyone, regardless of age, body
size, visible or invisible disability, ethnicity, sex characteristics, gender
identity and expression, level of experience, education, socio-economic status,
nationality, personal appearance, race, caste, color, religion, or sexual
identity and orientation.

We pledge to act and interact in ways that contribute to an open, welcoming,
diverse, inclusive, and healthy community.

### Our Standards

Examples of behavior that contributes to a positive environment for our
community include:

- Demonstrating empathy and kindness toward other people
- Being respectful of differing opinions, viewpoints, and experiences
- Giving and gracefully accepting constructive feedback
- Accepting responsibility and apologizing to those affected by our mistakes,
  and learning from the experience
- Focusing on what is best not just for us as individuals, but for the overall
  community

Examples of unacceptable behavior include:

- The use of sexualized language or imagery, and sexual attention or advances of
  any kind
- Trolling, insulting or derogatory comments, and personal or political attacks
- Public or private harassment
- Publishing others' private information, such as a physical or email address,
  without their explicit permission
- Other conduct which could reasonably be considered inappropriate in a
  professional setting

### Enforcement Responsibilities

Community leaders are responsible for clarifying and enforcing our standards of
acceptable behavior and will take appropriate and fair corrective action in
response to any behavior that they deem inappropriate, threatening, offensive,
or harmful.

Community leaders have the right and responsibility to remove, edit, or reject
comments, commits, code, wiki edits, issues, and other contributions that are
not aligned to this Code of Conduct, and will communicate reasons for moderation
decisions when appropriate.

### Scope

This Code of Conduct applies within all community spaces, and also applies when
an individual is officially representing the community in public spaces.
Examples of representing our community include using an official email address,
posting via an official social media account, or acting as an appointed
representative at an online or offline event.

### Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be
reported to the community leaders responsible for enforcement at
[GitHub Issues](https://github.com/LanikSJ/awscli-aliases/issues/new).
All complaints will be reviewed and investigated promptly and fairly.

All community leaders are obligated to respect the privacy and security of the
reporter of any incident.

### Enforcement Guidelines

Community leaders will follow these Community Impact Guidelines in determining
the consequences for any action they deem in violation of this Code of Conduct:

#### 1. Correction

**Community Impact**: Use of inappropriate language or other behavior deemed
unprofessional or unwelcome in the community.

**Consequence**: A private, written warning from community leaders, providing
clarity around the nature of the violation and an explanation of why the
behavior was inappropriate. A public apology may be requested.

#### 2. Warning

**Community Impact**: A violation through a single incident or series of
actions.

**Consequence**: A warning with consequences for continued behavior. No
interaction with the people involved, including unsolicited interaction with
those enforcing the Code of Conduct, for a specified period of time. This
includes avoiding interactions in community spaces as well as external channels
like social media. Violating these terms may lead to a temporary or permanent ban.

#### 3. Temporary Ban

**Community Impact**: A serious violation of community standards, including
sustained inappropriate behavior.

**Consequence**: A temporary ban from any sort of interaction or public
communication with the community for a specified period of time. No public or
private interaction with the people involved, including unsolicited interaction
with those enforcing the Code of Conduct, is allowed during this period.
Violating these terms may lead to a permanent ban.

#### 4. Permanent Ban

**Community Impact**: Demonstrating a pattern of violation of community
standards, including sustained inappropriate behavior, harassment of an
individual, or aggression toward or disparagement of classes of individuals.

**Consequence**: A permanent ban from any sort of public interaction within the
community.

### Attribution

This Code of Conduct is adapted from the [Contributor Covenant][homepage],
version 2.1, available at [version]

[homepage]: https://www.contributor-covenant.org
[version]: https://www.contributor-covenant.org/version/2/1/code_of_conduct.html
