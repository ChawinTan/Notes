## JWT token

Structure of a webtoken: `header.payload.signature`

### Header

Consist of:

```
{
"type" : "JWT",
"algo: "signing and encoding algo"
}

### Payload

```
{
issuer, subject, audience, expiration time, issued at
}
```
### Signature

data = base64urlencode(header+'.'+payload)<br/>
signature = HMAC-SHA256(data, publicKeyValue)

Must use HTTPS, validate algorithm name explicitly.

Server generates a token that certifies the user identity and sends it to the client. The client will send the token back to the server for every subsequent request so the server knows the request comes from a particular identity.

https://flaviocopes.com/jwt/#:~:text=Learn%20the%20basics%20of%20JWT%20and%20how%20to%20use%20them&text=It%20works%20this%20way%3A%20the,comes%20from%20a%20particular%20identity.

https://medium.com/@sureshdsk/how-json-web-token-jwt-authentication-works-585c4f076033

### Self signed pem file

`openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem`


### different types of tokens

#### Id tokens

Used for authentication and for the client only. It is used to determine who someone is, usually handled OpenId connect. We can decode it to access some basic information about the user. We should not use it for api access since an API expects the audience set to the API's unique identifier, hence authenticating with API would not work since id tokens has the audience set as the client's id. This would mean an API would not know if the client has modified the token (adding/removing scope).

#### Access tokens

Access tokens is used to grant a client access to an API. It is about "what are they allowed to do" and is usually build on Oauth2.0. They should not be used to authenticate a client since they don't containt any information about the client, hence unable to tell if the user has authenticated and when.

#### TLS stuff

One way TLS - TLS client to verify the identity of the TLS server, Front end verify backend
Two way TLS - Client can verify the identity of the server while server would then verify the identity of the client

### OAuth and OpenId

OpenId is a layer built on top of OAuth. It adds login and profile information about the person who is logged in. OAuth is for authentication (logging in) while OpenId provides an identity. OpenId enables scenarios such as single sign-on (sso).

OpenId connect flow is the same as OAuth. The exceptions are 

* a scope of `openid` is used in the initial request
* the client receives and `ID token` in addition to an Access token

1. Resource owner gets the client (app) to send a request to an autherization server with the following (clientid, redirect uri, response type, scope)
2. checks for an active session (resource owner logged in to the authorization server)
3. Resource owner gives the client (app) the list of scopes and notifies the autherization server
4. Authorization server returns the client (app) with an authorization code
5. Resource owner and app gives the authorization code, client Id and client Secret to the authorization server
6. authorization server returns with access token and id token
7. client then uses the acces token to exchange for whatever information is requested from the authorization server.

An Id token is a jwt.

Authorization server generates a clientId and client secret for all future OAth exchanges. Their sometimes known as App id and App secret.

https://developer.okta.com/blog/2019/10/21/illustrated-guide-to-oauth-and-oidc
