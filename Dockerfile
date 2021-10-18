# eks version
FROM debian:stretch-slim

LABEL maintainer="patoxs <patonxs@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends gcc apt-transport-https gnupg2 curl

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl

RUN pip install pipenv
RUN pip install awscli

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]