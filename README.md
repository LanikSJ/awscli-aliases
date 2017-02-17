# aws-alias

##Requirements

aws cli ``1.11.24`` or higher:
[AWS CLI User Guide](http://docs.aws.amazon.com/cli/latest/userguide/installing.html)

##Usage

```
$ git clone https://github.com/LanikSJ/awscli-aliases
$ mkdir -p ~/.aws/cli
$ ln -sf awscli-aliases/alias ~/.aws/cli/alias
```
##Test

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
