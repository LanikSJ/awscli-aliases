FROM amazon/aws-cli:2.5.6

RUN mkdir -p ~/.aws/cli

COPY alias /root/.aws/cli/alias

ENTRYPOINT ["/usr/local/bin/aws"]
