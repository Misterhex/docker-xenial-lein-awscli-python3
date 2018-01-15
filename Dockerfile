FROM ubuntu:xenial

RUN apt-get update -y  && apt-get upgrade -y

RUN apt-get install -y default-jre wget curl python3

RUN mkdir /lein

RUN cd /lein && wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein

RUN chmod a+x /lein/lein

ENV PATH "$PATH:/lein"

RUN lein

RUN curl -O https://bootstrap.pypa.io/get-pip.py

RUN python3 get-pip.py --user

ENV PATH="/root/.local/bin:${PATH}"

RUN pip3 install awscli --upgrade --user

RUN aws --version

RUN pip3 install awscli --upgrade --user

RUN aws --version
