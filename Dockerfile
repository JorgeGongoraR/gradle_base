FROM gradle:latest
WORKDIR /home/gradle/src

RUN chmod +x ./gradlew && \
    ./gradlew clean test --no-daemon && \
    ./gradlew build

EXPOSE 8080



