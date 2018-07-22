FROM pbhalesain/base

LABEL maintainer="pbhalesain@gmail.com"

ENV ZOOKEEPER_VERSION 3.4.12

#Download Zookeeper
RUN wget -q -O - http://apache.mirrors.nublue.co.uk/zookeeper/zookeeper-3.4.12/zookeeper-3.4.12.tar.gz | tar -xzf - -C /opt

#Configure
RUN mv /opt/zookeeper-${ZOOKEEPER_VERSION}/conf/zoo_sample.cfg /opt/zookeeper-${ZOOKEEPER_VERSION}/conf/zoo.cfg

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64/jre/
ENV ZK_HOME /opt/zookeeper-${ZOOKEEPER_VERSION}
RUN sed  -i "s|/tmp/zookeeper|$ZK_HOME/data|g" $ZK_HOME/conf/zoo.cfg; mkdir $ZK_HOME/data

ADD start-zk.sh /usr/bin/start-zk.sh 
EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper-${ZOOKEEPER_VERSION}

RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 
CMD /usr/sbin/sshd && bash /usr/bin/start-zk.sh
