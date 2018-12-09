+++
title = "HTTP 性能测试工具"
lastmod = 2018-12-05T08:33:43+08:00
tags = ["tools"]
categories = ["tools"]
draft = false
+++

主要介绍以下工具:

-   [ab - Apache HTTP server benchmarking tool](https://httpd.apache.org/docs/2.4/programs/ab.html)
-   [wrk - a HTTP benchmarking tool](https://github.com/wg/wrk)
-   [siege - an http load tester and benchmarking utility](https://github.com/JoeDog/siege)
-   [vegeta - HTTP load testing tool and library](https://github.com/tsenart/vegeta)
-   [jemeter - it was originally designed for testing Web Applications but has since expanded to other test functions](https://jmeter.apache.org/)

<!--more-->


## ab {#ab}


### 介绍 {#介绍}

TODO...


### 安装方法 {#安装方法}

```sh
# manjaor
sudo pacman -S apache

# macOS
brew insatll apache
```


### 常用参数 {#常用参数}

```sh
Usage: ab [options] [http[s]://]hostname[:port]/path
Options are:
    -n requests     Number of requests to perform
    -c concurrency  Number of multiple requests to make at a time
    -t timelimit    Seconds to max. to spend on benchmarking
                    This implies -n 50000
    -s timeout      Seconds to max. wait for each response
                    Default is 30 seconds
    -b windowsize   Size of TCP send/receive buffer, in bytes
    -B address      Address to bind to when making outgoing connections
    -p postfile     File containing data to POST. Remember also to set -T
    -u putfile      File containing data to PUT. Remember also to set -T
    -T content-type Content-type header to use for POST/PUT data, eg.
                    'application/x-www-form-urlencoded'
                    Default is 'text/plain'
    -v verbosity    How much troubleshooting info to print
    -w              Print out results in HTML tables
    -i              Use HEAD instead of GET
    -x attributes   String to insert as table attributes
    -y attributes   String to insert as tr attributes
    -z attributes   String to insert as td or th attributes
    -C attribute    Add cookie, eg. 'Apache=1234'. (repeatable)
    -H attribute    Add Arbitrary header line, eg. 'Accept-Encoding: gzip'
                    Inserted after all normal header lines. (repeatable)
    -A attribute    Add Basic WWW Authentication, the attributes
                    are a colon separated username and password.
    -P attribute    Add Basic Proxy Authentication, the attributes
                    are a colon separated username and password.
    -X proxy:port   Proxyserver and port number to use
    -V              Print version number and exit
    -k              Use HTTP KeepAlive feature
    -d              Do not show percentiles served table.
    -S              Do not show confidence estimators and warnings.
    -q              Do not show progress when doing more than 150 requests
    -l              Accept variable document length (use this for dynamic pages)
    -g filename     Output collected data to gnuplot format file.
    -e filename     Output CSV file with percentages served
    -r              Don't exit on socket receive errors.
    -m method       Method name
    -h              Display usage information (this message)
    -I              Disable TLS Server Name Indication (SNI) extension
    -Z ciphersuite  Specify SSL/TLS cipher suite (See openssl ciphers)
    -f protocol     Specify SSL/TLS protocol
                    (TLS1, TLS1.1, TLS1.2 or ALL)
```


### 使用实例 {#使用实例}

```sh
# 总共10000个请求，并发100个
ab -n 10000 -c 100 http://127.0.0.1:8000/
```

```sh
# 并发100个请求，持续30秒
ab -t 30 -c 100 http://127.0.0.1:8000/
```


### 结果说明 {#结果说明}

```nil
$ ab -n 10000 -c 100 http://localhost:8080/v1/object
This is ApacheBench, Version 2.3 <$Revision: 1826891 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking localhost (be patient)
Completed 1000 requests
Completed 2000 requests
Completed 3000 requests
Completed 4000 requests
Completed 5000 requests
Completed 6000 requests
Completed 7000 requests
Completed 8000 requests
Completed 9000 requests
Completed 10000 requests
Finished 10000 requests


Server Software:        beegoServer:1.11.1
Server Hostname:        localhost
Server Port:            8080

Document Path:          /v1/object
Document Length:        2001 bytes

Concurrency Level:      100
Time taken for tests:   2.780 seconds
Complete requests:      10000
Failed requests:        0
Non-2xx responses:      10000
Total transferred:      21540000 bytes
HTML transferred:       20010000 bytes
Requests per second:    3596.83 [#/sec] (mean)
Time per request:       27.802 [ms] (mean)
Time per request:       0.278 [ms] (mean, across all concurrent requests)
Transfer rate:          7566.00 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    8   4.4      8      27
Processing:     1   20  12.1     18     121
Waiting:        0   14   9.6     13     109
Total:          4   28  12.7     26     130

Percentage of the requests served within a certain time (ms)
  50%     26
  66%     29
  75%     31
  80%     32
  90%     36
  95%     40
  98%     52
  99%     93
100%    130 (longest request)
```


## wrk {#wrk}


### 介绍 {#介绍}

TODO...


### 安装方法 {#安装方法}

```sh
# manjaro
yaourt -S wrk

# macOS
brew insatll wrk
```


### 常用参数 {#常用参数}

```sh
Usage: wrk <options> <url>
  Options:
    -c, --connections <N>  Connections to keep open
    -d, --duration    <T>  Duration of test
    -t, --threads     <N>  Number of threads to use

    -s, --script      <S>  Load Lua script file
    -H, --header      <H>  Add header to request
        --latency          Print latency statistics
        --timeout     <T>  Socket/request timeout
    -v, --version          Print version details

  Numeric arguments may include a SI unit (1k, 1M, 1G)
  Time arguments may include a time unit (2s, 2m, 2h)
```


### 使用实例 {#使用实例}

```sh
# 使用10个线程，并发100个请求，持续10秒
wrk -t 10  -c 100 -d 10 http://localhost:8080/v1/object
```


### 结果说明 {#结果说明}

```sh
$ wrk -t10  -c100 -d10s shttp://localhost:8080/v1/object
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


### 介绍 {#介绍}

TODO...


### 安装方法 {#安装方法}

```sh
# manjaro
sudo pacman -S siege
# macOS
brew install siege
```


### 常用参数 {#常用参数}

```sh
$ siege
[alert] Zip encoding disabled; siege requires zlib support to enable it
SIEGE 4.0.4
Usage: siege [options]
      siege [options] URL
      siege -g URL
Options:
  -V, --version             VERSION, prints the version number.(版本)
  -h, --help                HELP, prints this section.
  -C, --config              CONFIGURATION, show the current config.(在屏幕上打印显示出当前的配置,配置是包括在他的配置文件$HOME/.siegerc中,可以编辑里面的参数,这样每次siege 都会按照它运行.)
  -v, --verbose             VERBOSE, prints notification to screen.(运行时能看到详细的运行信息)
  -q, --quiet               QUIET turns verbose off and suppresses output.
  -g, --get                 GET, pull down HTTP headers and display the
                            transaction. Great for application debugging.
  -p, --print               PRINT, like GET only it prints the entire page.
  -c, --concurrent=NUM      CONCURRENT users, default is 10 (并行启动（访问）用户数，默认是10, 不要设得太大,因为越大,siege 消耗本地机器的资源越多)
  -r, --reps=NUM            REPS, number of times to run the test. (每个连接发出的请求数量，这个与t有些类似，所以设置了这个值就不需要设置t了，反之亦然。)
  -t, --time=NUMm           TIMED testing where "m" is modifier S, M, or H (压力测试时间，比如-t5表示持续时间是5分钟,–time=n 持续运行siege ‘n’秒(如10S),分钟(10M),小时(10H))
                            ex: --time=1H, one hour test.
  -d, --delay=NUM           Time DELAY, random delay before each requst (hit每个url之间的延迟,在0-n之间)
  -b, --benchmark           BENCHMARK: no delays between requests.
  -i, --internet            INTERNET user simulation, hits URLs randomly. (随机访问urls.txt中的url列表项,以此模拟真实的访问情况(随机性),当urls.txt存在是有效)
  -f, --file=FILE           FILE, select a specific URLS FILE. (测试指定的一个URL,对它进行”siege “,此选项会忽略有关urls文件的设定)
  -R, --rc=FILE             RC, specify an siegerc file (指定用特定的siege 配置文件来运行,默认的为$HOME/.siegerc)
  -l, --log[=FILE]          LOG to FILE. If FILE is not specified, the
                            default is used: PREFIX/var/siege.log (运行结束,将统计数据保存到日志文件中siege .log,一般位于/usr/local/var/siege .log中,也可在.siegerc中自定义)
  -m, --mark="text"         MARK, mark the log file with a string.
                            between .001 and NUM. (NOT COUNTED IN STATS)
  -H, --header="text"       Add a header to request (can be many)
  -A, --user-agent="text"   Sets User-Agent in request
  -T, --content-type="text" Sets Content-Type in request
      --no-parser           NO PARSER, turn off the HTML page parser
      --no-follow           NO FOLLOW, do not follow HTTP redirects

Copyright (C) 2017 by Jeffrey Fulmer, et al.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.
```


### 使用实例 {#使用实例}

```sh
# 启动100个用户（线程）在1分钟内进行并发访问
siege -c 200 -t 1 http://localhost:8080/v1/oject
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

```sh
$ siege -c 200 -t 1 http://localhost:8080/v1/oject
...
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


## vegeta {#vegeta}


### 介绍 {#介绍}

TODO...


### 安装方法 {#安装方法}

TODO...


### 常用参数 {#常用参数}

TODO...


### 使用实例 {#使用实例}

TODO...


## jemeter {#jemeter}


### 介绍 {#介绍}

TODO...


### 安装方法 {#安装方法}

TODO...


### 常用参数 {#常用参数}

TODO...


### 使用实例 {#使用实例}

TODO...


## 其他性能测试测试工具 {#其他性能测试测试工具}

-   locust
    -   <https://locust.io/>
-   Vegeta
    -   <https://www.hi-linux.com/posts/4650.html>
    -   <https://github.com/tsenart/vegeta>
-   jemeter
-   <https://wetest.qq.com/lab/view/410.html>
-   <https://www.testwo.com/blog/7692>
-   <https://github.com/biezhi/java-bible/blob/master/web/test%5Ftool.md>
