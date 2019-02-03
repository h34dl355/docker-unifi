FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install apt-transport-https  apt-utils -y

RUN echo 'deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti' | tee /etc/apt/sources.list.d/100-ubnt-unifi.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50 

RUN apt-get update
RUN apt-get install openjdk-8-jre-headless -y
RUN apt-get install unifi -y

COPY ./run.sh /run.sh 
ENTRYPOINT ["./run.sh"] 
