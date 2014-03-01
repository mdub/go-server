FROM ubuntu
MAINTAINER Ashlin Eldridge

# Install Java 7 JDK
RUN apt-get update && apt-get -y install python-software-properties
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java7-installer

# Install other tooling that will be used by Go
RUN apt-get install -y git

# Install unzip (needed by Go)
RUN apt-get install -y unzip

# Install the Go server and agent
RUN wget http://download01.thoughtworks.com/go/13.4.1/ga/go-server-13.4.1-18342.deb -O /tmp/go-server.deb
RUN wget http://download01.thoughtworks.com/go/13.4.1/ga/go-agent-13.4.1-18342.deb -O /tmp/go-agent.deb
RUN dpkg -i /tmp/go-server.deb
RUN dpkg -i /tmp/go-agent.deb

ADD go-server.defaults /etc/default/go-server

# Go runs on port 8153 by default
# Shouldn't this expose 8153 on the VM?
EXPOSE 8153

CMD ["/etc/init.d/go-server", "start"]
