FROM dockerfile/java
MAINTAINER Mike Williams <mdub@dogbiscuit.org>

# Install unzip (needed by Go)
RUN apt-get install -y unzip

# Install the Go server
RUN curl -o /tmp/go-server.deb http://download01.thoughtworks.com/go/13.4.1/ga/go-server-13.4.1-18342.deb
RUN dpkg -i /tmp/go-server.deb

# Expose ports for HTTP and HTTPS
EXPOSE 80
EXPOSE 443

ADD start.sh /usr/local/bin/start

CMD start
