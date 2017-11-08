# Old Versions:
#  * 2.32.1: FROM jenkins/jenkins:2.32.1

# 2.73.2 is the current LTS as of 2/11/2017
FROM jenkins/jenkins:2.73.2
USER root
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# install-plugins.sh script was broken in 2.32.1.  Use this version instead. 
# This version of install-plugins is from 1d93bc066863b44bc804b2623b4bf7264425bbb1
# The version that comes by default with 2.32.1 is broken.
#COPY install-plugins.sh /usr/local/bin/install-plugins.sh
#RUN chmod a+x /usr/local/bin/install-plugins.sh

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
USER jenkins
