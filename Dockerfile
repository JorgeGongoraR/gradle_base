FROM gradle:latest
COPY . /home/gradle/src
WORKDIR /home/gradle/src
RUN chmod +x ./gradlew && \
    ./gradlew clean test --no-daemon && \
    ./gradlew build

EXPOSE 8081
