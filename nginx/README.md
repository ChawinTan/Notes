# NGINX

1. Provides http server capabilities
2. Uses Non threaded and event driven architecture
3. Web server for reverse proxying, caching and load balancing
4. Proxy server for email

Master slave architecture by supporting event driven, asynchronous and non blocking model

Workers are single thread processes. Workers accept request requests from a shared listen socket, executes a highly effecient run loop to process thousands of connections per worker.

Master performs priviliged operations such as reading configuration (eg, number of workers). Everything about configuration is in the configuration file.

## Blocking vs Non-blocking

Blocking - synchronous code. Requires process to hold on to extra memory while waiting for the I/O operations to finish. Needs to create extra threads and allocate extra memory if you want to execute other stuff.

Non-blocking - Asynchronous. Handled by a single thread. Push the I/O operation(callback) into another queue while it executes other task. Once the operation finished, callback will be executed.

## Worker process vs Worker connections

Worker connections is the number of connections that each process can handle simultanously

## Commands

1. `brew install nginx`
2. `brew services start nginx`
3. `curl http://127.0.0.1:8080`


