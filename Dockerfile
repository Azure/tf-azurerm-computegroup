FROM ruby:2.3
LABEL maintainer="Damien Caro <dcaro@microsoft.com>"

COPY . /tf-test
RUN apt-get update && apt-get install unzip
RUN curl -o /tf-test/terraform.zip https://releases.hashicorp.com/terraform/0.10.8/terraform_0.10.8_linux_amd64.zip 
RUN unzip /tf-test/terraform.zip -d /usr/local/bin
WORKDIR /tf-test
VOLUME ["/root/.ssh/"]
RUN ["bundle", "install"]
RUN ["rake", "build"]

CMD [ "e2e" ]
ENTRYPOINT [ "rake" ]
