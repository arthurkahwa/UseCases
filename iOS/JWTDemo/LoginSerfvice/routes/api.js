const express = require('express');
const app = express();
const jwt = require('jsonwebtoken');
const router = express.Router();

// Body parser to parse json
app.use(express.json());

// Constants for the demo
// Generally, these would come from a database
const users = [
    {username: 'User1', password: 'password321'},
    {username: 'User2', password: 'password432'}
];

// The login route
router.post('/login', (request,response) => {
    const username = request.body.username;
    const password = request.body.password;

    const authenticatedUser = users.find(user => {
        return user.username === username && user.password === password;
    });

    if (!authenticatedUser) {
        response.json({message: 'Authentication Failed.', success: false});
    }

    const token = jwt.sign({username: username}, "SECRET_KEY");
    if (!token) {
        response.json({message: 'Authentication Failed.', success: false});
    }

    response.json({token: token, success: true});
});

module.exports = router;