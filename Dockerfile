FROM alpine:latest

RUN apk add py-pip curl
RUN pip install awscli
RUN aws --version
RUN curl -L -o /usr/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
RUN curl -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /usr/bin/aws-iam-authenticator
RUN chmod +x /usr/bin/kubectl
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
