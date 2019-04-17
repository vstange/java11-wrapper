# Always use a version
FROM adoptopenjdk/openjdk11:alpine

LABEL maintainer="vinc.sohn@gmail.com"

COPY /target/java-wrapper-1.0-SNAPSHOT.jar java-wrapper.jar

# In versions 8, 9, and 10 you have to enable the detection of container-limited amount of RAM using the following options
# RUN java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -jar java-wrapper.jar
