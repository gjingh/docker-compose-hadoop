FROM centos:centos7.9.2009

RUN yum -y update 

RUN mkdir -p /home/local/java
COPY ./jdk-8u341-linux-x64.tar.gz /home/local/java
RUN tar -zxvf /home/local/java/jdk-8u341-linux-x64.tar.gz -C /home/local/java

ENV JAVA_HOME=/home/local/java/jdk1.8.0_341
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

RUN yum install -y net-tools curl netcat perl nc which

ENV HADOOP_VERSION 2.10.1

COPY ./hadoop-2.10.1.tar.gz /tmp/hadoop.tar.gz

RUN set -x \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

RUN mkdir /etc/hadoop
RUN cp -r /opt/hadoop-$HADOOP_VERSION/etc/hadoop/* /etc/hadoop

RUN cp /etc/hadoop/mapred-site.xml.template /etc/hadoop/mapred-site.xml
RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

ENV HADOOP_PREFIX=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV HADOOP_LIBEXEC_DIR=${HADOOP_HOME}/libexec
ENV MULTIHOMED_NETWORK=1

ENV USER=root
ENV PATH=$HADOOP_HOME/bin/:$PATH

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
