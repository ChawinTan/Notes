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

