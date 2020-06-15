FROM python:3.8-alpine
COPY requirements.txt requirements.txt
RUN apk --no-cache update && apk upgrade \
    && pip3 install -r requirements.txt && mkdir -p ~/.aws/cli \
    && yes | pip3 uninstall pip && rm -f requirements.txt
COPY alias /root/.aws/cli/alias
ENTRYPOINT ["/usr/local/bin/aws"]
