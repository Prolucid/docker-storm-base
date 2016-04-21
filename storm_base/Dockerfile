FROM phusion/baseimage
MAINTAINER Daniel Covello

# Use baseimage-docker's init system
CMD ["/sbin/my_init"] 

# Install storm dependencies +utilities
RUN apt-get update && apt-get install -y unzip openjdk-7-jre-headless wget python
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

# Install Storm
RUN wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-0.9.5/apache-storm-0.9.5.tar.gz | tar -xzf - -C /opt

ENV STORM_HOME /opt/apache-storm-0.9.5
RUN groupadd storm; useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; chown -R storm:storm $STORM_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm

RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm

# Add configuration + startup scripts
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD storm.yaml $STORM_HOME/conf/storm.yaml

RUN mkdir /etc/service/storm
ADD start-storm.sh /etc/service/storm/run
RUN chmod +x /etc/service/storm/run

# Add Volumes
VOLUME ["/var/log/storm"]

