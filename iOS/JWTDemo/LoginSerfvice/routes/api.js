const express = require('express');
const app = express();
const jsonWebToken = require('jsonwebtoken');
const router = express.Router();

// Body parser to parse json
app.use(express.json());

// Constants for the demo
const SECRET_KEY = 'SECRET_KEY';
// Generally, these would come from a database
const users = [
    {username: 'User1', password: 'password321'},
    {username: 'User2', password: 'password432'}
];

const accounts = [
    {
        id: 1,
        name: 'Leanne Graham',
        username: 'Bret',
        email: 'Sincere@april.biz',
        address: {
            street: 'Kulas Light',
            suite: 'Apt. 556',
            city: 'Gwenborough',
            zipcode: '92998-3874',
            geo: {
                lat: 40.741895,
                lng: -73.989308
            }
        },
        phone: '1-770-736-8031 x56442',
        website: 'hildegard.org',
        company: {
            name: 'Romaguera-Crona',
            catchPhrase: 'Multi-layered client-server neural-net',
            bs: 'harness real-time e-markets'
        }
    },
    {
        id: 2,
        name: 'Ervin Howell',
        username: 'Antonette',
        email: 'Shanna@melissa.tv',
        address: {
            street: 'Victor Plains',
            suite: 'Suite 879',
            city: 'Wisokyburgh',
            zipcode: '90566-7771',
            geo: {
                lat: 6.032334136094421,
                lng: 11.333315288898135
            }
        },
        phone: '010-692-6593 x09125',
        website: 'anastasia.net',
        company: {
            name: 'Deckow-Crist',
            catchPhrase: 'Proactive didactic contingency',
            bs: 'synergize scalable supply-chains'
        }
    },
    {
        id: 3,
        name: 'Clementine Bauch',
        username: 'Samantha',
        email: 'Nathan@yesenia.net',
        address: {
            street: 'Douglas Extension',
            suite: 'Suite 847',
            city: 'McKenziehaven',
            zipcode: '59590-4157',
            geo: {
                lat: -8.505999,
                lng: -35.000868
            }
        },
        phone: '1-463-123-4447',
        website: 'ramiro.info',
        company: {
            name: 'Romaguera-Jacobson',
            catchPhrase: 'Face to face bifurcated interface',
            bs: 'e-enable strategic applications'
        }
    }
];

// The login route
router.post('/login', (request, response) => {
    const username = request.body.username;
    const password = request.body.password;

    const authenticatedUser = users.find(user => {
        return user.username === username && user.password === password;
    });

    if (!authenticatedUser) {
        response.json({message: 'Authentication Failed.', success: false});
    }

    const token = jsonWebToken.sign({username: username}, SECRET_KEY);
    if (!token) {
        response.json({message: 'Authentication Failed.', success: false});
    }

    response.json({token: token, success: true});
});

// Get accounts after authentication
// Middleware to authenticate the request
function authenticate(request, response, next) {
    const authorizationFlag = request.headers['authorization'];

    if (!authorizationFlag) {
        response.json({message: 'Authentication Failed.', success: false});
    }

    const token = authorizationFlag.split(' ')[1]
    if (!token) {
        response.json({message: 'Authentication Failed.', success: false});
    }

    const decoded = jsonWebToken.verify(token, SECRET_KEY);
    const username = decoded.username;

    const authenticatedUser =
        users.find(user => user.username === username);

    if (!authenticatedUser) {
        response.json({message: 'Authentication Failed.', success: false});
    }

    next();
}

router.get('/accounts', authenticate, (request, response) => {
    response.json(accounts);
});

module.exports = router;