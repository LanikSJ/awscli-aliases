# aws-alias

## Requirements

aws cli ``1.11.24`` or higher:
[AWS CLI User Guide](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)

Use ``update_awscli.sh`` script to install / update AWS CLI if yours is out of date. Use ``aws --version`` to verify.

## Usage

```
$ mkdir -p GitHub; cd GitHub
$ git clone https://github.com/LanikSJ/awscli-aliases
$ mkdir -p ~/.aws/cli
$ ln -sf ~/GitHub/awscli-aliases/alias ~/.aws/cli/alias
```
## Test

```
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

Please report any bugs or issues you find.  Thanks!
