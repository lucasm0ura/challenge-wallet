# README

## Requirements

- Ruby 3.0.0
- PostgreSQL 11 or upper
- Postman or similar

## Steps

To generate database and tables:

```
$ bin/setup
```

To start the server - Port 3000:

```
$ bundle exec rails s
```
or

``` 
$ rails s
```

## Access Auth via API

1 - Use credentials to access the API Auth (can use the User created at seed)

SUBMIT POST to http://localhost:3000/api/auth/sign_in

``` 
{
    "email": "EMAIL",
    "password": "PASSWORD"
}
```

2 - After this, you need to get in the Headers result:
   - 2.1 - access-token
   - 2.2 - client
   - 2.3 - uid

Set in your Headers to autenticate your API-URLS submits ( GET, PUT, POST, DELETE )

CREATE API USER - POST
```
http://localhost:3000/api/v1/users
```
UPDATE API USER - PUT
```
http://localhost:3000/v1/users/ID_USER
```
SHOW API USER - GET
```
http://localhost:3000/v1/users/ID_USER
```
DELETE API USER - DELETE
```
http://localhost:3000/v1/users/ID_USER
```

Json to create a User

``` 
{
    "user": {
        "email": "EMAIL",
        "password": "PASSWORD",
        "password_confirmation": "CONFIRM_PASSWORD",
        "name": "USER NAME",
        "role_id": ID_ROLE ( 1 - ADMINISTRATOR, 2 - USER)
    }
}
```