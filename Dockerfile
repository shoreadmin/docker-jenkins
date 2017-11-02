# 2.73.2 is the current LTS as of 2/11/2017
# 2.32.1 current
#FROM jenkins/jenkins:2.32.1
# run with docker build -t dstg/jenkins:2.32.1 .
FROM jenkins:2.32.1
USER root
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# This version of install-plugins is from 1d93bc066863b44bc804b2623b4bf7264425bbb1
# The version that comes by default with 2.32.1 is broken.
COPY install-plugins.sh /usr/local/bin/install-plugins.sh
RUN chmod a+x /usr/local/bin/install-plugins.sh

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
USER jenkins
