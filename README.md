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
待添加


# rabbitmq
待添加

## FAQ 报错
