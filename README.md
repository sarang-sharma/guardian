# Guardian

Guardian is an open source Auth solution that lets you-

- Implement Login and Registration flows for your native apps or web apps
- Integrate your existing User Service and be in complete control of your data
- Become an OpenID Provider, your users can now Login to other apps using your APIs!

and much more! You get the flexibility of maintaining your own users
while Guardian manages the Authentication and Authorization for you.

## Table of Contents

1. [Features](#Features)
2. [Quickstart](#Quickstart)
3. [Development & Contribution](#development--contribution)

## Features

- Register and Login users using
    - Mobile and Email OTPs (Passwordless)
    - Username and password
    - Social Identity Providers (Google, Facebook)
- Manage Sessions
    - Get sessions on all devices
    - Logout from one device
    - Logout from all devices
- OpenID provider
    - Enable your users to Login on other applications via their accounts on your platform
- Analytics

## Quickstart

You'll need the following dependencies to start working with Guardian on your machine
```
docker
maven
```
Once your dependencies are installed, run the following command-
```sh
./quick-start.sh
```

And, That's it! You should now have Guardian running on your local system.  
Since this is a mock setup, all dependencies, user, sms and email are mocked, along with
most of the tenant configs.  


Let's test the passwordless flow using the signinup flow to register and login a new user. Use the following API to
start the passwordless flow.  

```curl
curl --location 'localhost:8080/v1/passwordless/init' \
--header 'Content-Type: application/json' \
--header 'tenant-id: tenant1' \
--data '{
  "flow": "signinup",
  "responseType": "token",
  "contacts": [
    {
      "channel": "sms",
      "identifier": "9999999999"
    }
  ],
  "metaInfo": {
    "ip": "127.0.0.1",
    "location": "localhost",
    "deviceName": "localhost",
    "source": "app"
  }
}'
```

To complete the passwordless flow, hit the following API.
Since this is a mock setup, intead of an actual random OTP, a mock otp (999999) is generated instead. Update the state
you got from the response of the init API. 

```curl
curl --location 'localhost:8080/v1/passwordless/complete' \
--header 'Content-Type: application/json' \
--header 'tenant-id: tenant1' \
--data '{
  "state": "fill-state-here",
  "otp": "999999"
}'
```

Congrats! This user is now registered and logged in to your app.  
You should now have the user credentials (acessToken and refreshToken) which can be used by your client application to
access your backend APIs securely. 
 

## Development & Contribution

Link to CONTRIBUTING.MD
