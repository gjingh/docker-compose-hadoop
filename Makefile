DOCKER_NETWORK = dockerhadoop_default
ENV_FILE = hadoop.env
current_branch := v1
build:
	docker build -t zgj2022/hadoop-base:$(current_branch) ./base
	docker build -t zgj2022/hadoop-namenode:$(current_branch) ./namenode
	docker build -t zgj2022/hadoop-datanode:$(current_branch) ./datanode
	docker build -t zgj2022/hadoop-resourcemanager:$(current_branch) ./resourcemanager
	docker build -t zgj2022/hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build -t zgj2022/hadoop-historyserver:$(current_branch) ./historyserver
	docker build -t zgj2022/hadoop-submit:$(current_branch) ./submit

	docker build -t zgj2022/hadoop-hive:$(current_branch) ./hive-base
	docker build -t zgj2022/hadoop-hive-pg:$(current_branch) ./hive-pg
	


# wordcount:
# 	docker build -t hadoop-wordcount ./submit
# 	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} zgj2022/hadoop-base:$(current_branch) hdfs dfs -mkdir -p /input/
# 	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} zgj2022/hadoop-base:$(current_branch) hdfs dfs -copyFromLocal /opt/hadoop-2.7.4/README.txt /input/
# 	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
# 	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} zgj2022/hadoop-base:$(current_branch) hdfs dfs -cat /output/*
# 	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} zgj2022/hadoop-base:$(current_branch) hdfs dfs -rm -r /output
# 	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} zgj2022/hadoop-base:$(current_branch) hdfs dfs -rm -r /input
