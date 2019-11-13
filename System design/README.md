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

# Useful components in system design

1. Api gateway

An api gateway has serveral features.

An api gateway can be seen as a layer in front of your application that separates out the necessary functionality (such as security, authentication, authorization etc....) from your business logic.

That is every time a request is made to your server, it will check if the request is secure, authorize .... meets the requirement before passing it back to your server.

It can also use to perform routing to different services (endpoints) and load balancing across muliple copies of a service.

It can also replace multiple api calls with one call, serve static content and cache response.

Adapter to newer versions of protocols (eg. convert http2 to http) and to expose your service url for public usage
