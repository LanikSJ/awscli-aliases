<<<<<<< HEAD
# AWS CLI Aliases [![Codacy Badge](https://api.codacy.com/project/badge/Grade/8d6dd836703e4f37a636c7086fedf619)](https://www.codacy.com/app/LanikSJ/awscli-aliases?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=LanikSJ/awscli-aliases&amp;utm_campaign=Badge_Grade) [![Build Status](https://travis-ci.com/LanikSJ/awscli-aliases.svg?branch=master)](https://travis-ci.com/LanikSJ/awscli-aliases) [![GPLv3 license](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html)
=======
# AWS CLI Aliases
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/8d6dd836703e4f37a636c7086fedf619)](https://www.codacy.com/app/LanikSJ/awscli-aliases?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=LanikSJ/awscli-aliases&amp;utm_campaign=Badge_Grade) [![Build Status](https://travis-ci.com/LanikSJ/awscli-aliases.svg?branch=master)](https://travis-ci.com/LanikSJ/awscli-aliases) [![GPLv3 license](https://img.shields.io/badge/License-GPLv3-blue.svg)](http://perso.crans.org/besson/LICENSE.html)
>>>>>>> 8858cd1501aad142dd45d197ab42e6a0bd2818b5

## Requirements

aws cli ``1.11.24`` or higher:
[AWS CLI User Guide](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)

Use ``awscli.sh`` script to install / update AWS CLI if yours is out of date. Use ``aws --version`` to verify.

## Usage

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
Same as ``aws sts get-caller-identity``

Output:

```
{
    "Account": "1234567890",
    "UserId": "AROAJGILZWBHUUPCERBWY",
    "Arn": "arn:aws:sts::1234567890:user/UserId"
}
```
## Bugs

Please report any bugs or issues you find. Thanks!
