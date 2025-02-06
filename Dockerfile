FROM amazon/aws-cli:2.23.14

USER root
RUN yum install -y shadow-utils
RUN useradd -ms /home/redhat redhat

USER redhat
WORKDIR /home/redhat

RUN mkdir -p ~/.aws/cli
COPY alias ~/.aws/cli/alias

HEALTHCHECK --interval=5m --timeout=3s \
  CMD /usr/local/bin/aws || exit 1

ENTRYPOINT ["/usr/local/bin/aws"]
