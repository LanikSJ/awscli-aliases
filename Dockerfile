FROM alpine:3.11.2
COPY requirements.txt requirements.txt
RUN apk --no-cache add python3 && pip3 install -U pip && \
   pip3 install -r requirements.txt && mkdir -p ~/.aws/cli && \
   yes | pip3 uninstall pip && rm -f requirements.txt
COPY alias /root/.aws/cli/alias
ENTRYPOINT ["/usr/bin/aws"]
