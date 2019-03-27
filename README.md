# docker-nacos-sentinel-rocketmq-rabbitmq
docker-nacos-sentinel-rocketmq-rabbitmq

nacos 注册发现服务中心

sentinel 熔断；分布式系统的流量防卫兵；Sentinel 以流量为切入点，从流量控制、熔断降级、系统负载保护等多个维度保护服务的稳定性

rocketmq

rabbitmq

```shell
cd docker

docker-compose up

```

# mysql 数据库 默认用户名和密码

账号/密码：root/root

端口：3306

# nacos mysql 主从数据用户名及密码

请自行查看 `docker/nacos/env/`目录下相关用户及密码

来源于 官方 https://github.com/nacos-group/nacos-docker


# nacos 分布式配置中心

端口：8848

访问地址
```shell
http://127.0.0.1:8848/nacos/
```

# rocketmq console 控制台
端口：8180

```SHELL
http://localhost:8180
```

## rocketmq No route info of this topic
原因 Broker禁止自动创建Topic，且用户没有通过手工方式创建Topic，请自行创建 topic

# sentinel 
端口：8700

```SHELL
http://localhost:8700
```

# elasticsearch

官方DOCKER地址

https://www.docker.elastic.co/

## 基本配置
### 注意.端口

在安装组件之前需要确保以下端口没有被占用:9200 9300 (Elasticsearch)

同时需要确保内核参数 vm_max_map_count 至少设置为262144:
```SHELL
sudo sysctl -w vm.max_map_count=262144
```
或
```SHELL
sudo echo "vm.max_map_count=262144" >> /etc/sysctl.conf

sysctl -p
```

### 先下载 词库，如果你不需要词库 请PASS
https://github.com/medcl/elasticsearch-analysis-ik/releases
```SHELL
wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.5.4/elasticsearch-analysis-ik-6.5.4.zip
```
解压缩 到 `elasticsearch/plugins`目录中，并将文件名改为`analysis-ik`

配置 `analysis-ik/config` 目录下`IKAnalyzer.cfg.xml`文件
```XML
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd">
<properties>
	<comment>IK Analyzer 扩展配置</comment>
	<!--用户可以在这里配置自己的扩展字典 -->
	<entry key="ext_dict">main.dic;extra_main.dic;</entry>
	 <!--用户可以在这里配置自己的扩展停止词字典-->
	<entry key="ext_stopwords"></entry>
	<!--用户可以在这里配置远程扩展字典 -->
	<!-- <entry key="remote_ext_dict">words_location</entry> -->
	<!--用户可以在这里配置远程扩展停止词字典-->
	<!-- <entry key="remote_ext_stopwords">words_location</entry> -->
</properties>
```
最后 修改配置文件 `docker-xxxx.yml` 选择你的配置文件，把如下一行 前面的`#`号删除
```angular2html
#- ./elasticsearch/plugins/analysis-ik:/usr/share/elasticsearch/plugins/analysis-ik
```

### 目录权限

数据存储目录,目录设置 `777` 权限，否则启动不成功

```YML
chmod -R 777 ./elasticsearch/data
```

# rabbitmq
待添加


# java

查看网络名
```SHELL
docker network ls
```
查看所有容器IP
```SHELL
docker inspect --format='{{.Name}} - {{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
```

根据得到的`网络名`->`nsrr`和`ip地址段`->`172.18.0.x`
设置新的容器加入到该网络中
```SHELL
docker run -d -it -p 7020:7020 -h provider-mdc -v `pwd`:/opt \
--name=provider-mdc --network=nsrr --ip=172.18.0.20 docker_java-demo -Djava.security.egd=file:/dev/./urandom -jar /opt/provider-mdc.jar
```

# elasticsearch
端口
`9200`

`9300`
# kibana 
端口
`5601`

```shell
http://localhost:5601
```

## FAQ 报错
