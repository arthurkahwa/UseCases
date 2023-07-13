# JWTDemo

A simple demonstration User Authentication using the following:
* JWT (JSON Web Token) User Authentication
* Swift Actors
* MapKit in Swift
* Consuming a REST service in SwiftUI using _async/await_
 
## iOS App
This is the frontend of the demo. 

*_Please start the REST Service before using the App_*
- Open the Xcode project ```iOSApp/JWTDemo/JWTDemo.xcodeproj```
- Chage the ```Tea``` in the app settings
- Run the app

![JWTDemo iOS App](images/jwtdemo.gif)

## Using the web service
This is an ```express.js``` application.

It is documented at:
[JWTDemo Rest Service](https://documenter.getpostman.com/view/24142402/2s946eADkj)

1.  Open a terminal or command line
2. ```cd``` to the ```LoginSerfvice/bin``` folder
3. Execute ```node WWW```
4. The two configured users are:

| Username | Password    |
|:---------|:------------|
| User1    | password321 |
| User2    | password432 |

5. The two Endpoints are 
	- ```http://localhost:3000/api/login```
	- ```http://localhost:3000/api/accounts``` 

### Login and user authenticated access
Login is an ```HTTP POST``` action.

A typical login attempt with curl would be:

```curl
curl --location 'http://localhost:3000/api/login' \
--header 'Content-Type: application/json' \
--data '{
    "username": "User1", 
    "password": "password321"
}'
```
The typical answer would be:
```json
{
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlVzZXIxIiwiaWF0IjoxNjg5MjYxOTA3fQ.ES1KuWMS_n9rhlWgAo4lDzErKXpXr20-B8bdYGw6KD4",
    "success": true
}
```

Once the token is obtained, a typical request for the restricted resource would be:
```curl
curl --location 'http://localhost:3000/api/accounts' \
--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlVzZXIxIiwiaWF0IjoxNjg5MjYxOTA3fQ.ES1KuWMS_n9rhlWgAo4lDzErKXpXr20-B8bdYGw6KD4'
```

And a typical answer would be:
```json
[
    {
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "Sincere@april.biz",
        "address": {
            "street": "Kulas Light",
            "suite": "Apt. 556",
            "city": "Gwenborough",
            "zipcode": "92998-3874",
            "geo": {
                "lat": 40.741895,
                "lng": -73.989308
            }
        },
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
            "name": "Romaguera-Crona",
            "catchPhrase": "Multi-layered client-server neural-net",
            "bs": "harness real-time e-markets"
        }
    },
    {
        "id": 2,
        "name": "Ervin Howell",
        "username": "Antonette",
        "email": "Shanna@melissa.tv",
        "address": {
            "street": "Victor Plains",
            "suite": "Suite 879",
            "city": "Wisokyburgh",
            "zipcode": "90566-7771",
            "geo": {
                "lat": 6.032334136094421,
                "lng": 11.333315288898135
            }
        },
        "phone": "010-692-6593 x09125",
        "website": "anastasia.net",
        "company": {
            "name": "Deckow-Crist",
            "catchPhrase": "Proactive didactic contingency",
            "bs": "synergize scalable supply-chains"
        }
    },
    {
        "id": 3,
        "name": "Clementine Bauch",
        "username": "Samantha",
        "email": "Nathan@yesenia.net",
        "address": {
            "street": "Douglas Extension",
            "suite": "Suite 847",
            "city": "McKenziehaven",
            "zipcode": "59590-4157",
            "geo": {
                "lat": -8.505999,
                "lng": -35.000868
            }
        },
        "phone": "1-463-123-4447",
        "website": "ramiro.info",
        "company": {
            "name": "Romaguera-Jacobson",
            "catchPhrase": "Face to face bifurcated interface",
            "bs": "e-enable strategic applications"
        }
    }
]
```

Should there be a failure in the authentication, a typical response would be:
```json
{
    "message": "Authentication Failed.",
    "success": false
}
```
