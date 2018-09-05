FROM java:openjdk-7-jdk

ENV MAVEN_VERSION 3.3.9

RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_OPTS=-Dhttps.protocols=TLSv1,TLSv1.1,TLSv1.2

# Copy application to container
RUN mkdir -p app
WORKDIR /app

CMD ["mvn", "package"]