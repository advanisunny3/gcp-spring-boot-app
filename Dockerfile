RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
  
FROM anapsix/alpine-java:jre8


MAINTAINER James Heggs jimbobegg@hotmail.com

ADD target/spring-boot-app*.jar /spring-boot-app.jar
RUN sh -c 'touch /spring-boot-app.jar'

EXPOSE 8080

CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/spring-boot-app.jar"]
