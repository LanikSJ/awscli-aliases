FROM amazon/aws-cli:2.22.7

RUN mkdir -p ~/.aws/cli

COPY alias /root/.aws/cli/alias

USER awscli

HEALTHCHECK --interval=5m --timeout=3s \
  CMD /usr/local/bin/aws || exit 1

ENTRYPOINT ["/usr/local/bin/aws"]
