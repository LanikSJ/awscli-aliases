# AWS CLI Aliases

[![Actions Status](https://github.com/LanikSJ/awscli-aliases/workflows/CI/badge.svg)](https://github.com/LanikSJ/awscli-aliases/actions)

-   [Requirements](#requirements)
-   [Usage](#usage)
-   [Test](#test)
-   [Docker](#docker)
-   [Bugs](#bugs)
-   [License](#license)
-   [Donate](#donate)

## Requirements

AWS CLI `1.11.24` or higher, see
[AWS CLI User Guide](http://docs.aws.amazon.com/cli/latest/userguide/installing.html) for more info.

Use `awscli.sh` script to install / update AWS CLI if yours is out of date. Use `aws --version` to verify.

## Usage

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/8d6dd836703e4f37a636c7086fedf619)](https://www.codacy.com/app/LanikSJ/awscli-aliases?utm_source=github.com&utm_medium=referral&utm_content=LanikSJ/awscli-aliases&utm_campaign=Badge_Grade)
[![codecov](https://codecov.io/gh/LanikSJ/awscli-aliases/branch/master/graph/badge.svg)](https://codecov.io/gh/LanikSJ/awscli-aliases)

```bash
$ mkdir -p GitHub; cd GitHub
$ git clone https://github.com/LanikSJ/awscli-aliases
$ mkdir -p ~/.aws/cli
$ ln -sf ~/GitHub/awscli-aliases/alias ~/.aws/cli/alias
```

## Test

```bash
aws whoami
```

Same as `aws sts get-caller-identity`

Output:

    {
        "Account": "1234567890",
        "UserId": "AROAJGILZWBHUUPCERBWY",
        "Arn": "arn:aws:sts::1234567890:user/UserId"
    }

## Docker

[![Actions Status](https://github.com/LanikSJ/awscli-aliases/workflows/Docker%20Publish/badge.svg)](https://github.com/LanikSJ/awscli-aliases/actions)
[![Quay](https://quay.io/repository/laniksj/awscli-aliases/status "Docker Repository on Quay")](https://quay.io/repository/laniksj/awscli-aliases)
![Docker Pulls](https://img.shields.io/docker/pulls/laniksj/awscli-aliases.svg?style=flat)
![Docker Size](https://img.shields.io/docker/image-size/laniksj/awscli-aliases?sort=date)

If you would like to try the aliases in a docker container and already have AWS CLI installed:

```bash
$ docker run -v ~/.aws/credentials:/root/.aws/credentials:ro -it quay.io/laniksj/awscli-aliases whoami
```

## Bugs

Please report any bugs or issues you find. Thanks!

## License

[![MIT License](https://img.shields.io/badge/license-MIT-blue)](https://en.wikipedia.org/wiki/MIT_License)

## Donate

[![Patreon](https://img.shields.io/badge/patreon-donate-red.svg)](https://www.patreon.com/laniksj/overview)
