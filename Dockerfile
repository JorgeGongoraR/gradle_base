FROM gradle:latest AS gradle

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN addgroup -g ${GROUP_ID} gradle \
 && adduser -D gradle -u ${USER_ID} -g gradle -G gradle -s /bin/bash -h /home/gradle

COPY --chown=glade:glade . /home/gradle/src
WORKDIR /home/gradle/src
RUN chmod +x ./gradlew && \
    ./gradlew clean test --no-daemon && \
    ./gradlew build

FROM openjdk:latest
EXPOSE 8081
RUN mkdir /app
COPY --from=gradle /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar
