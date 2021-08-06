# README

## Requirements

- Ruby 3.0.0
- PostgreSQL 11 or upper / Docker container
- Postman or similar (I use Insomnia)

## Steps

To prepare Docker (If you choose this way)
On terminal after you installed Docker in your computer

First, Install Postgres and pgadmin container in Docker CLI
- PostgreSQL
```
$ docker pull postgres
```
- pgAdmin4
```
$ docker pull dpage/pgadmin4
```
- PostgreSQL Run Container
```
$ docker run -p 5432:5432 --name postgreSQL -e POSTGRES_PASSWORD=postgres -d postgres
```
- pgAdmin Run Container (Put email and password to signin plataform to see databases and configure)
```
$ docker run -p 5050:80 -e "PGADMIN_DEFAULT_EMAIL=PUT_YOUR_EMAIL" -e "PGADMIN_DEFAULT_PASSWORD=PUT_YOUR_PASSWORD" -d  dpage/pgadmin4
```
PS: You can access the pgadmin4 via this link: http://localhost:5050/

To configure is pretty simple:
- Create a Server
- Put a name in General
- Host name/address: host.docker.internal and default port: 5432 with username that you started your docker postgres container ( in the example before was postgres)

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


ADD MONEY TO WALLET
```
http://localhost:3000/api/v1/users/USER_ID/wallet/WALLET_ID/add

```

REMOVE MONEY TO WALLET
```
http://localhost:3000/api/v1/users/USER_ID/wallet/WALLET_ID/remove

```
Json to send or remove money to wallet
```
{
	"value": 750.0
}
```

VERIFY HISTORY INPUT AND OUTPUT TO WALLET ( ordered by date and time)
```
http://localhost:3000/api/v1/users/USER_ID/wallet/WALLET_ID/index

```

VERIFY HISTORY INPUT AND OUTPUT TO WALLET ( FILTER VIA PERIOD)
```
http://localhost:3000/api/v1/users/USER_ID/wallet/WALLET_ID/period

{
	"initial_date": "2021/08/01",
	"end_date": "2021/08/30"
}

```