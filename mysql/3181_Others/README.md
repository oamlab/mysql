- OAMlab
- https://github.com/oamlab

# MySQL的几种部署结构(Several deployment structures of MySQL)

---

# MySQL

## 几种部署结构 

### [MySQL(Docker)](./README.MySQL.Docker.md)

|                                             操作系统版本                                              |                                                Docker版本                                                 |                   MySQL容器版本                    |                      PhpMyAdmin容器版本                      | VM配置(qcow2) | VM数量 |
|:-----------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------------------:|:----------------------------------------------:|:--------------------------------------------------------:|:-----------:|:----:|
| [CentOS Stream 9](https://mirror.tuna.tsinghua.edu.cn/centos-stream/9-stream/BaseOS/x86_64/iso) | [docker-ce-27.1.2](https://mirror.tuna.tsinghua.edu.cn/docker-ce/linux/centos/9/x86_64/stable/Packages) | [mysql:latest](https://hub.docker.com/_/mysql) | [phpmyadmin:latest](https://hub.docker.com/_/phpmyadmin) |  8C32G10T   |  1   |

### [MySQL(M-S)](./README.MySQL.M-S.md)

|                                             操作系统版本                                              |                                                Docker版本                                                 |                                  MySQL版本                                  |                      PhpMyAdmin容器版本                      | VM配置(qcow2) | VM数量 |
|:-----------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------:|:--------------------------------------------------------:|:-----------:|:----:|
| [CentOS Stream 9](https://mirror.tuna.tsinghua.edu.cn/centos-stream/9-stream/BaseOS/x86_64/iso) | [docker-ce-27.1.2](https://mirror.tuna.tsinghua.edu.cn/docker-ce/linux/centos/9/x86_64/stable/Packages) | [MySQL Community Server 8.4.2 LTS](https://dev.mysql.com/downloads/mysql) | [phpmyadmin:latest](https://hub.docker.com/_/phpmyadmin) |  8C32G10T   |  2   |

- 各节点之间的网络通信距离

|      节点名    | MySQL-node-01 | MySQL-node-02 |
|:-------------:|:-------------:|:-------------:|
| MySQL-node-01 |     0.1ms     |     10ms      |
| MySQL-node-02 |     10ms      |     0.1ms     |

- 各节点的角色

|      节点名    | 写能力 |    读能力  |    备份能力  |     实际承载写业务 |      实际承载读业务  |     用于灾备   |
|:-------------:|:---:|:---------:|:-----------:|:---------------:|:-----------------:|:-------------:|
| MySQL-node-01 |  是  |     是    |      是     |        是        |         是        |       否      |
| MySQL-node-02 |  否  |     是    |      是     |        否        |         是        |       是      |

### [MySQL(M-M-M-M-M)](./README.MySQL.M-M-M-M-M.md)

|                                             操作系统版本                                              |                                                Docker版本                                                 |                                MySQL版本                                 |                      PhpMyAdmin容器版本                      | VM配置(qcow2) | VM数量 |
|:-----------------------------------------------------------------------------------------------:|:-------------------------------------------------------------------------------------------------------:|:----------------------------------------------------------------------:|:--------------------------------------------------------:|:-----------:|:----:|
| [CentOS Stream 9](https://mirror.tuna.tsinghua.edu.cn/centos-stream/9-stream/BaseOS/x86_64/iso) | [docker-ce-27.1.2](https://mirror.tuna.tsinghua.edu.cn/docker-ce/linux/centos/9/x86_64/stable/Packages) | [MySQL NDB Cluster 8.4.2 LTS](https://dev.mysql.com/downloads/cluster) | [phpmyadmin:latest](https://hub.docker.com/_/phpmyadmin) |  8C32G10T   |  5   |

- 各节点之间的网络通信距离

|      节点名    | MySQL-node-01 | MySQL-node-02 | MySQL-node-03 | MySQL-node-04 | MySQL-node-05 |
|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|
| MySQL-node-01 |     0.1ms     |     10ms      |     200ms     |     200ms     |     200ms     |
| MySQL-node-02 |     10ms      |     0.1ms     |     200ms     |     200ms     |     200ms     |
| MySQL-node-03 |     200ms     |     200ms     |     0.1ms     |     200ms     |     200ms     |
| MySQL-node-04 |     200ms     |     200ms     |     200ms     |     0.1ms     |     200ms     |
| MySQL-node-05 |     200ms     |     200ms     |     200ms     |     200ms     |     0.1ms     |

- 各节点的角色

|      节点名    |    写能力    |    读能力  |    备份能力  |     实际承载写业务 |      实际承载读业务  |    用于灾备   |
|:-------------:|:----------:|:---------:|:-----------:|:---------------:|:-----------------:|:-----------:|
| MySQL-node-01 |     是      |     是    |      是     |        是        |         是        |      否     |
| MySQL-node-02 |     是      |     是    |      是     |        否        |         是        |      是     |
| MySQL-node-03 |     是      |     是    |      是     |        否        |         是        |      是     |
| MySQL-node-04 |     是      |     是    |      是     |        否        |         是        |      是     |
| MySQL-node-05 |     是      |     是    |      是     |        否        |         是        |      是     |

## 预设的解决方案目标
````
1、部署方法
2、管理面板
3、范例配置文件
4、慢执行分析工具
5、日志审计
6、SQL变更预审与风险管理
7、数据库备份
8、数据库回滚
9、破坏性实验：单主机停机影响与恢复，单主机灭失影响与恢复
10、其他场景
````