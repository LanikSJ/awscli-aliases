FROM alpine:3.9
RUN apk --no-cache add python3 && pip3 install -U pip && \
   pip3 install awscli && mkdir -p ~/.aws/cli && \
   yes | pip3 uninstall pip
COPY alias /root/.aws/cli/alias
ENTRYPOINT ["/usr/bin/aws"]
CMD ["/bin/sh"]
