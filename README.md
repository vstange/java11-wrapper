# java10-wrapper test

## Prerequisite

- Open JDK 11
  - Download Open JDK 11 from https://adoptopenjdk.net
  - Extract *.tar.gz into persistent directory
  - Setup it as a SDK in your IDE
  
- Docker
  - Download and install Docker from https://docs.docker.com/install/

## Initialization

- Checkout repository via git
- Import repository in IntelliJ IDEA
- Click `File > Open` and select repository's folder
- Let IntelliJ do its magic to resolve Maven modules

## Build

The Docker build is dependent on the target files build by the Maven build process.
Maven must run for before Docker.

### Maven

Your JAVA_HOME should point towards your Java 11 directory or you run Maven via your IDE.

    mvn clean install

### Docker

    docker build -t java11wrapper .

Run the spring boot server with:

    docker run --rm -p 8080:8080 -it java11wrapper
    
    curl http://localhost:8080/ping     # should return 2Hello World"

**Old** - before change to Spring Boot server:
   
Test if docker runs fine

    docker run --rm -it java11wrapper java -version
    
and test the AION API Demo
    
    docker run --rm -it java11wrapper java -jar java-wrapper.jar -h

## AION API

### Maven

https://mvnrepository.com/artifact/org.aion.network/aion_api

    <dependency>
        <groupId>org.aion.network</groupId>
        <artifactId>aion_api</artifactId>
        <version>0.1.15</version>
        <exclusions>
            <exclusion>
                <groupId>org.slf4j</groupId>
                <artifactId>*</artifactId>
            </exclusion>
        </exclusions>
    </dependency>

### Build it yourself

GitHub Page: https://github.com/aionnetwork/aion_api

Build documentation: https://github.com/aionnetwork/aion_api/wiki/Api-Build-Guild

    cd aion_api
    ./gradlew clean
    ./gradlew build

Had to change in the `gradlew` file: 
`JAVACMD` replaced with `/home/vstange/jdk/jdk-10.0.2+13/bin/java` my 
local Java 10 call, since my JAVA_HOME targets my Java 8 installation.

**Jar** can be found in `./pack`

# Test Data

## Docker Images Sizes

    docker images java11wrapper

| ID | Version | Size
| ------------ | ------ | -------
| adoptopenjdk/openjdk11 | alpine | 362 MB 

