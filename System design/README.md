# Monolith

## Advantages

1. less complex, less moving parts
2. faster calls (no need to pass calls through network)
3. good for cohesive teams

## Disadvantages

1. onboarding new team member
2. complicated deployment
3. single point of failure

# Micro services

## Advantages

1. scalability (independent services)
2. easy onboarding
3. reduce coupling (both developer and functionality)
4. easy to see which service is experiencing issue

## Disadvantages

1. needs a good architect

# Scaling

## Horizontal
Buy more machines

1. Load balancing required
2. Back ups should one machine fail
3. Network calls (slow)
4. Data consistency is an issue
5. Scales linearly (well)

## Vertical
Buy bigger machines

1. Load balancing not required
2. Single point of failure
3. Inter process communication
4. Data is consistent
5. Hardware limit

# Message queue

Messaging queue is used for ...
1. Enabling clients to multi-task (distribute its resources while waiting for api response)
2. The server to prioritize the tasks (no need to do it in order)
3. Persisting data

A messaging queue is essentially assignment, load balancing, hearbeat and persistence in one package.

# Useful components in system design

1. Api gateway

An api gateway has serveral features.

An api gateway can be seen as a layer in front of your application that separates out the necessary functionality (such as security, authentication, authorization etc....) from your business logic.

That is every time a request is made to your server, it will check if the request is secure, authorize .... meets the requirement before passing it back to your server.

It can also use to perform routing to different services (endpoints) and load balancing across muliple copies of a service.

It can also replace multiple api calls with one call, serve static content and cache response.

Adapter to newer versions of protocols (eg. convert http2 to http) and to expose your service url for public usage (keep track of client usage and billing them)

2. Data bases

Good for persisting data in queues

Some useful fields:
1. Id (which server handled which tasks)
2. Done or not

3. Notifier

Can consist of a heartbeat mechanism and a load balancer.<br/>
Heartbeat mechanism to know if server is still responding<br/>
Load Balancer is there to ensure that should a server fail, incomplete task do not get duplicated in other queues as a result of principles like consistent hashing.

# Pub sub model

## Pub Sub vs Req Res

Advantages:
- De coupling
- consistent data storage
- Single point of failure
- Message persistence - guarantees message will be passed to child services at least once
- scalable - can easily hook a new service to a message broker


Disadvantages:
- no atomicity, cannot use for mission critical systems where response can only be true or false
- developers need to configure code to guarantee idempotency

Example:

Take for example the system below:

```
Client -> System 1 -> System 2 -> System 3 and 4
                   -> database1-> database2
```

In a req res model, when a failure happens at system 4, system 1 might still be waiting for a response from 4. Also, databases 1 and 2 might have multiple records of the same data change from system 1 and 2. It is also hard to understand where the system fails since there are coupling between different systems.

In a Pub sub model, direct connections with services can be handled with a message queue.

```
System 1 -> message queue -> system 2
                          -> system 3
```

