# Always use a version
FROM adoptopenjdk/openjdk9:alpine

LABEL maintainer="vinc.sohn@gmail.com"


# In versions 8, 9, and 10 you have to enable the detection of container-limited amount of RAM using the following options
# RUN java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
