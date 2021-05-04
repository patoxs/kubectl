# eks version
FROM alpine/k8s:1.16.15

LABEL maintainer="patoxs <patonxs@gmail.com>"

RUN apk add --update \
        coreutils \
        py-pip

RUN pip install awscli

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]