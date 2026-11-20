# 🛠️ AWS CLI Aliases

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/ae3e23f1514c42c897423d3e23544b55)](https://www.codacy.com/gh/LanikSJ/awscli-aliases/dashboard?utm_source=github.com&utm_medium=referral&utm_content=LanikSJ/awscli-aliases&utm_campaign=Badge_Grade)
![GitHub Repo Size](https://img.shields.io/github/repo-size/laniksj/awscli-aliases)
![GitHub Code Size in Bytes](https://img.shields.io/github/languages/code-size/laniksj/awscli-aliases)
![GitHub Last Commit](https://img.shields.io/github/last-commit/laniksj/awscli-aliases)
![GitHub Commit Activity](https://img.shields.io/github/commit-activity/m/laniksj/awscli-aliases)

## 📑 Table of Contents

- [📦 Requirements](#-requirements)
- [⚡ Usage](#-usage)
- [🧪 Test](#-test)
- [🐳 Docker](#-docker)
- [🐛 Bugs](#-bugs)
- [📝 License](#-license)
- [💰 Donate](#-donate)

## 📦 Requirements

AWS CLI `1.11.24` or higher, see
[AWS CLI User Guide](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)
for more info.

Use `awscli.sh` script to install / update AWS CLI if yours is out of date.
Use `aws --version` to verify.

More detailed Installation and Usage Instructions are available in the [Wiki](https://github.com/LanikSJ/awscli-aliases/wiki).

## ⚡ Usage

```bash
mkdir -p GitHub; cd GitHub
git clone https://github.com/LanikSJ/awscli-aliases
mkdir -p ~/.aws/cli
ln -sf ~/GitHub/awscli-aliases/alias ~/.aws/cli/alias
```

## 🧪 Test

```bash
aws whoami
```

Same as `aws sts get-caller-identity`

Output:

```sh
{
    "Account": "1234567890",
    "UserId": "ABCDEFGHIJKLMNOPQRSTUV",
    "Arn": "arn:aws:sts::1234567890:user/UserId"
}
```

## 🐳 Docker

[![docker-publish](https://github.com/LanikSJ/awscli-aliases/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/LanikSJ/awscli-aliases/actions/workflows/docker-publish.yml)
[![docker-hub](https://github.com/LanikSJ/awscli-aliases/actions/workflows/docker-hub.yml/badge.svg)](https://github.com/LanikSJ/awscli-aliases/actions/workflows/docker-hub.yml)

If you would like to try the aliases in a docker container:

```bash
docker run \
  -v ~/.aws/credentials:/home/redhat/.aws/credentials:ro \
  -it ghcr.io/laniksj/awscli-aliases whoami
```

## 🐛 Bugs

Please report any bugs or issues you find. Thanks!

## ⚙️ Skills Automation

This repository maintains agent skills via `skills-lock.json`. The GitHub Actions
workflow automatically updates the skills monthly and creates a pull request.

- **Workflow**: `.github/workflows/skills-update.yml`
- **Schedule**: Monthly on the 1st at 06:00 UTC
- **Manual run**: `npx skills update`

## 📝 License

[![MIT License](https://img.shields.io/badge/license-MIT-blue)](https://en.wikipedia.org/wiki/MIT_License)

## 💰 Donate

[![Patreon](https://img.shields.io/badge/patreon-donate-blue.svg)](https://www.patreon.com/laniksj/overview)
