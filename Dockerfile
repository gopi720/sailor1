FROM ubuntu:20.04
ENV JAVA_HOME=/u01/middleware/jdk-11
ENV TOMCAT_HOME=/u01/middleware/apache-tomcat-9.0.107
RUN mkdir -p /u01/middleware
WORKDIR /u01/middleware
RUN apt install -y openjdk-11-jdk
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.107/bin/apache-tomcat-9.0.107.tar.gz .
RUN tar -xzvf apache-tomcat-9.0.107.tar.gz
COPY target/speed.war ./apache-tomcat-9.0.107/webapps
COPY run.sh .
RUN chmod u+x run.sh
CMD ( "sh", "run.sh" )