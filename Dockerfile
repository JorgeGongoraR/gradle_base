FROM gradle:latest AS gradle
COPY --chown=glade:glade . /home/gradle/src
WORKDIR /home/gradle/src
RUN chmod +x ./gradlew && \
    ./gradlew clean test --no-daemon && \
    ./gradlew build

FROM openjdk:latest
EXPOSE 8081
RUN mkdir /app
COPY --from=gradle /home/gradle/src/build/libs/*.jar /app/spring-boot-application.jar
