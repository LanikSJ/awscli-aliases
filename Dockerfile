FROM alpine:3.12.0
COPY requirements.txt requirements.txt
RUN apk --no-cache update && apk add --no-cache python3 wget \
    && wget -q --no-check-certificate https://bootstrap.pypa.io/get-pip.py \
    && apk del wget && python3 get-pip.py && rm -f get-pip.py \
    && pip3 install -r requirements.txt && mkdir -p ~/.aws/cli \
    && yes | pip3 uninstall pip && rm -f requirements.txt
COPY alias /root/.aws/cli/alias
ENTRYPOINT ["/usr/bin/aws"]
