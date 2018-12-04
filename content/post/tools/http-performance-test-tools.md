+++
title = "HTTP 性能测试工具"
lastmod = 2018-12-04T23:22:19+08:00
tags = ["tools"]
categories = ["tools"]
draft = false
+++

主要介绍一下三个工具:

-   [ab - Apache HTTP server benchmarking tool](https://httpd.apache.org/docs/2.4/programs/ab.html)
-   [wrk - a HTTP benchmarking tool](https://github.com/wg/wrk)
-   [siege - an http load tester and benchmarking utility](https://github.com/JoeDog/siege)

<!--more-->


## ab {#ab}


### 安装方法 {#安装方法}

```sh
# Ubuntu
sudo apt-get install apache2-utils

# macOS
brew insatll apache
```


### 常用参数 {#常用参数}

TODO...


### 使用实例 {#使用实例}

```sh
# 总共10000个请求，并发100个
ab -n 10000 -c 100 http://127.0.0.1:8000/
```

```sh
# 并发100个请求，持续30秒
ab -t 30 -c 100 http://127.0.0.1:8000/
```

详细的命令使用信息可以参考文档。


### 结果说明 {#结果说明}

```nil
Server Software:        TornadoServer/4.3
Server Hostname:        127.0.0.1
Server Port:            8001

Document Path:          /resource
Document Length:        3 bytes

Concurrency Level:      100
Time taken for tests:   31.115 seconds
Complete requests:      16337
Failed requests:        0
Total transferred:      3300074 bytes
HTML transferred:       49011 bytes
Requests per second:    525.06 [#/sec] (mean)
Time per request:       190.456 [ms] (mean)
Time per request:       1.905 [ms] (mean, across all concurrent requests)
Transfer rate:          103.58 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   1.5      0     180
Processing:     1  109  24.9    108     290
Waiting:        1  109  24.9    108     290
Total:          1  109  24.9    108     291

Percentage of the requests served within a certain time (ms)
  50%    108
  66%    110
  75%    112
  80%    114
  90%    120
  95%    133
  98%    181
  99%    254
100%    291 (longest request)
```


## wrk {#wrk}


### 安装方法 {#安装方法}

```sh
# Ubuntu
# 请查看官方的安装方法文档。

# macOS
brew insatll wrk
```


### 常用参数 {#常用参数}

TODO...


### 使用实例 {#使用实例}

```sh
# 使用10个线程，并发100个请求，持续10秒
wrk -t10  -c100 -d10s shttp://localhost:8080/v1/object
```


### 结果说明 {#结果说明}

```sh
Running 10s test @ shttp://localhost:8080/v1/object
  10 threads and 100 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     9.83ms    4.21ms  58.76ms   85.91%
    Req/Sec     1.04k   138.77     1.36k    79.60%
  103311 requests in 10.02s, 35.47MB read
Requests/sec:  10308.88
Transfer/sec:      3.54MB
```


## siege {#siege}


### 安装方法 {#安装方法}

```sh
#

# macOS
brew install siege
```


### 常用参数 {#常用参数}

```sh
–V：版权说明信息
-v: 运行时能看到详细的运行信息
-C 或 –config: 在屏幕上打印显示出当前的配置,配置是包括在他的配置文件$HOME/.siegerc中,可以编辑里面的参数,这样每次siege 都会按照它运行.
–c n 或 –concurrent=n: 并行启动（访问）用户数，默认是10(n不要设得太大,因为越大,siege 消耗本地机器的资源越多)
-t：压力测试时间，比如-t5表示持续时间是5分钟,–time=n 持续运行siege ‘n’秒(如10S),分钟(10M),小时(10H)
-r：每个连接发出的请求数量，这个与t有些类似，所以设置了这个值就不需要设置t了，反之亦然。
-i,–internet: 随机访问urls.txt中的url列表项,以此模拟真实的访问情况(随机性),当urls.txt存在是有效
-d n,–delay=n: hit每个url之间的延迟,在0-n之间
-r n,–reps=n: 重复运行测试n次,不能与 -t同时存在
-l: 运行结束,将统计数据保存到日志文件中siege .log,一般位于/usr/local/var/siege .log中,也可在.siegerc中自定义
-R SIEGERC,–rc=SIEGERC: 指定用特定的siege 配置文件来运行,默认的为$HOME/.siegerc
-u URL,–url=URL: 测试指定的一个URL,对它进行”siege “,此选项会忽略有关urls文件的设定
-f FILE, –file=FILE ：对应一个文件，这个文件里每一行为一个URL链接(默认为urls.txt,位于siege 安装目录下的etc/urls.txt)，格式如：
```


### 使用实例 {#使用实例}

```sh
# 启动100个用户（线程）在1分钟内对某一页面www.zihou.me进行并发访问
siege http://www.zihou.me -c200 -t1
```

```sh
# 对多个页面进行并发访问
# 新建一个文件urls，里面的内容为（只是例子，任何url都可以）：
http://localhost:8080/v1/object
http://localhost:8080/v1/user

# 表示启动200个用户在1分钟内并发访问以上的url网址。
siege -f urls -c200 -t1
```


### 结果说明 {#结果说明}

...

```sh
Lifting the server siege...
Transactions:		       31338 hits      # 完成31338次请求
Availability:		       98.51 %         # 成功率 98.51%
Elapsed time:		       64.62 secs      # 总共使用时间
Data transferred:	        6.22 MB        # 总共传输数据
Response time:		        0.32 secs      # 响应时间, 显示网络连接时间
Transaction rate:	      484.96 trans/sec # 平均每秒完成的474个请求
Throughput:		        0.10 MB/sec        # 平均每秒传输数据
Concurrency:		      155.75           # 实际 最大并发连接树
Successful transactions:       31338       # 成功处理次数
Failed transactions:	         474i      # 失败处理次数
Longest transaction:	       21.92       # 每次传输所花的最长时间
Shortest transaction:	        0.00       # 每天传输所花的最短时间
```


## 其他性能测试测试工具 {#其他性能测试测试工具}

-   locust
    -   <https://locust.io/>
-   gatling
    -   <https://www.hi-linux.com/posts/4650.html>
-   Vegeta
    -   <https://www.hi-linux.com/posts/4650.html>
    -   <https://github.com/tsenart/vegeta>
-   jemeter
-   locust
-   <https://wetest.qq.com/lab/view/410.html>
-   <https://www.testwo.com/blog/7692>
-   <https://github.com/biezhi/java-bible/blob/master/web/test%5Ftool.md>
