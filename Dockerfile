FROM ubuntu:14.04 
MAINTAINER Florian Kuhn <kuhn@ids-mannheim.de>
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y git

# Install oracle java 8 
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
# suppress graphical EULA confirmation dialogue. -y or --force-yes do not work here 
RUN yes | apt-get install oracle-java8-installer

# Install maven
RUN apt-get install -y maven

# Install vtd-xml 2.12
WORKDIR /tmp
RUN wget --no-check-certificate https://62.113.211.193/tools/vtd-xml-2.12.jar
RUN mvn install:install-file -Dfile=vtd-xml-2.12.jar -DgroupId=com.ximpleware -DartifactId=vtd-xml -Dversion=2.12 -Dpackaging=jar
RUN rm vtd-xml-2.12.jar

# Install the curation module
WORKDIR /opt
RUN git clone https://github.com/clarin-eric/clarin-curation-module.git
WORKDIR /opt/clarin-curation-module
RUN mvn clean package

# copy depencies to use core libs via cli
WORKDIR /opt/clarin-curation-module/curation-module-core
RUN mvn dependency:copy-dependencies
WORKDIR /opt/clarin-curation-module/curation-module-core/target
# rename the jarfile to something less spacious
RUN mv curation-module-core*.jar curate.jar
WORKDIR /
RUN alias startcurate="java -jar /opt/clarin-curation-module/curation-module-core/target/curate.jar"
# How to start the curation module via cli
# java -cp curate.jar:path_to_maven_dependecies/* eu.clarin.cmdi.curation.main.Main -help
# or 
# java -cp curate.jar:path_to_maven_dependecies/* eu.clarin.cmdi.curation.main.Main
