FROM amazon/aws-cli:2.13.35

RUN mkdir -p ~/.aws/cli

COPY alias /root/.aws/cli/alias

ENTRYPOINT ["/usr/local/bin/aws"]
