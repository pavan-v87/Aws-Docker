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

#CMD ["/bin/sh", "/startup.sh"]
#wget -O kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64 && \
#wget -O kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
