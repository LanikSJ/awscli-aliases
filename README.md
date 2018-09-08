# AWS CLI Aliases [![Codacy Badge](https://api.codacy.com/project/badge/Grade/8d6dd836703e4f37a636c7086fedf619)](https://www.codacy.com/app/LanikSJ/awscli-aliases?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=LanikSJ/awscli-aliases&amp;utm_campaign=Badge_Grade)

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/b59e54424206442e8dfa31065faf526c)](https://app.codacy.com/app/LanikSJ/awscli-aliases?utm_source=github.com&utm_medium=referral&utm_content=LanikSJ/awscli-aliases&utm_campaign=Badge_Grade_Dashboard)

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
