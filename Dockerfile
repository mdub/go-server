FROM dockerfile/java
MAINTAINER Mike Williams <mdub@dogbiscuit.org>

# Install unzip (needed by Go)
RUN apt-get install -y unzip

# Install the Go server
RUN wget http://download01.thoughtworks.com/go/13.4.1/ga/go-server-13.4.1-18342.deb -O /tmp/go-server.deb
RUN dpkg -i /tmp/go-server.deb

# Expose ports for HTTP and HTTPS
EXPOSE 8153
EXPOSE 8154

ADD start.sh /usr/local/bin/start

CMD start
