FROM zgj2022/hadoop-base:v1


ARG HIVE_VERSION
ENV HIVE_VERSION=${HIVE_VERSION:-2.3.2}
ENV HADOOP_VERSION 2.10.1

ENV HIVE_HOME /opt/hive
ENV PATH $HIVE_HOME/bin:$PATH
ENV HADOOP_HOME /opt/hadoop-$HADOOP_VERSION

WORKDIR /opt

#Install Hive and PostgreSQL JDBC
COPY ./apache-hive-2.3.2-bin.tar.gz apache-hive-2.3.2-bin.tar.gz

RUN yum install -y wget procps && \
	tar -xzvf apache-hive-$HIVE_VERSION-bin.tar.gz && \
	mv apache-hive-$HIVE_VERSION-bin hive && \
	wget https://jdbc.postgresql.org/download/postgresql-9.4.1212.jar -O $HIVE_HOME/lib/postgresql-jdbc.jar && \
	rm apache-hive-$HIVE_VERSION-bin.tar.gz 

#Custom configuration goes here
ADD ./conf/hive-site.xml $HIVE_HOME/conf
ADD ./conf/beeline-log4j2.properties $HIVE_HOME/conf
ADD ./conf/hive-env.sh $HIVE_HOME/conf
ADD ./conf/hive-exec-log4j2.properties $HIVE_HOME/conf
ADD ./conf/hive-log4j2.properties $HIVE_HOME/conf
ADD ./conf/ivysettings.xml $HIVE_HOME/conf
ADD ./conf/llap-daemon-log4j2.properties $HIVE_HOME/conf

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY ./startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

EXPOSE 10000
EXPOSE 10002

ENTRYPOINT ["entrypoint.sh"]
CMD startup.sh