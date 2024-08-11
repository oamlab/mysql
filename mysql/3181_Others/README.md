- OAMlab
- https://github.com/oamlab

# MySQL的几种部署结构(Several deployment structures of MySQL)

---

# MySQL

## 几种部署结构 

### [MySQL(Docker)](./README.MySQL.Docker.md)

|      操作系统版本   |      Docker版本    |  MySQL容器版本 |   PhpMyAdmin容器版本 |  VM配置(qcow2) | VM数量 |
|:----------------:|:------------------:|:------------:|:------------------:|:--------------:|:----:|
| CentOS Stream 9  | docker-ce-20.10.21 | mysql:latest | phpmyadmin:latest  |    8C32G10T    |  1   |

### [MySQL(M-S)](./README.MySQL.M-S.md)

|   操作系统版本       |      Docker版本       |             MySQL版本            |   PhpMyAdmin容器版本  |  VM配置(qcow2) |  VM数量  |
|:------------------:|:-------------------:|:--------------------------------:|:-------------------:|:-------------:|:-------:|
|  CentOS Stream 9   | docker-ce-20.10.21  | MySQL Community Server 8.4.2 LTS |  phpmyadmin:latest  |   8C32G10T    |    2    |

- 各节点之间的网络通信距离

|      节点名    | MySQL-node-01 | MySQL-node-02 |
|:-------------:|:-------------:|:-------------:|
| MySQL-node-01 |      0ms      |     10ms      |
| MySQL-node-02 |     10ms      |      0ms      |

- 各节点的角色

|      节点名    | 写能力 |    读能力  |    备份能力  |     实际承载写业务 |      实际承载读业务  |     用于灾备   |
|:-------------:|:---:|:---------:|:-----------:|:---------------:|:-----------------:|:-------------:|
| MySQL-node-01 |  是  |     是    |      是     |        是        |         是        |       否      |
| MySQL-node-02 |  否  |     是    |      是     |        否        |         是        |       是      |

### [MySQL(M-M-M-M-M)](./README.MySQL.M-M-M-M-M.md)

|     操作系统版本  |      Docker版本       |             MySQL版本           |   PhpMyAdmin容器版本  |   VM配置(qcow2)  |   VM数量  |
|:---------------:|:-------------------:|:-------------------------------:|:-------------------:|:---------------:|:---------:|
| CentOS Stream 9 | docker-ce-20.10.21  |   MySQL NDB Cluster 8.4.2 LTS   |  phpmyadmin:latest  |    8C32G10T     |     5     |

- 各节点之间的网络通信距离

|      节点名    | MySQL-node-01 | MySQL-node-02 | MySQL-node-03 | MySQL-node-04 | MySQL-node-05 |
|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|:-------------:|
| MySQL-node-01 |      0ms      |     200ms     |     200ms     |     200ms     |     200ms     |
| MySQL-node-02 |     200ms     |     0ms       |     200ms     |     200ms     |     200ms     |
| MySQL-node-03 |     200ms     |     200ms     |      0ms      |     200ms     |     200ms     |
| MySQL-node-04 |     200ms     |     200ms     |     200ms     |      0ms      |     200ms     |
| MySQL-node-05 |     200ms     |     200ms     |     200ms     |     200ms     |     0ms       |

- 各节点的角色

|      节点名    |    写能力    |    读能力  |    备份能力  |     实际承载写业务 |      实际承载读业务  |    用于灾备   |
|:-------------:|:----------:|:---------:|:-----------:|:---------------:|:-----------------:|:-----------:|
| MySQL-node-01 |     是      |     是    |      是     |        是        |         是        |      否     |
| MySQL-node-02 |     是      |     是    |      是     |        否        |         是        |      是     |
| MySQL-node-03 |     是      |     是    |      是     |        否        |         是        |      是     |
| MySQL-node-04 |     是      |     是    |      是     |        否        |         是        |      是     |
| MySQL-node-05 |     是      |     是    |      是     |        否        |         是        |      是     |