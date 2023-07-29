const express = require('express');
const router = express.Router();
const users = require('../data/users.json');

/* GET users listing. */
router.get('/', function (request, response, next) {
    response.json(users);
});

router.get('/:id', function (request, response, next) {
    let user = users.find(user => user.id == request.params.id);

    response.json(user);
});

module.exports = router;
