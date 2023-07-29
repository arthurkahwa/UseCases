const express = require('express');
const router = express.Router();
const todos = require('../data/todos.json');

router.get('/', function(request, response, next) {
    response.json(todos);
});

router.get('/:id', function(request, response, next) {
    const todo = todos.find( result => result.id == request.params.id );

    response.json(todo);
});

router.get('/user/:userid', function(request, response, next){
    const _albums = todos.filter( result => result.userId == request.params.userid);

    response.json(_albums);
});

module.exports = router;