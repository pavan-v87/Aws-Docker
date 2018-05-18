FROM alpine:3.7

COPY kops /kops
COPY kubectl /kubectl
COPY startup.sh /startup.sh

RUN apk update && \
    apk add bash && \
    apk add wget && \
    apk add curl && \
    apk add python && \
    apk add py-pip && \
    chmod +x /startup.sh && \
    chmod +x /kops && \
    mv /kops /usr/local/bin/ && \
	chmod +x /kubectl && \
  	mv /kubectl /usr/local/bin/kubectl && \
  	pip install awscli

ENTRYPOINT /startup.sh