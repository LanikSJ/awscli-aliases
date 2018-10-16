FROM alpine

RUN apk --no-cache add python3 && pip3 install -U pip && pip3 install awscli && mkdir -p ~/.aws/cli

COPY alias ~/.aws/cli/alias

CMD ["awscli", "whoami"]
