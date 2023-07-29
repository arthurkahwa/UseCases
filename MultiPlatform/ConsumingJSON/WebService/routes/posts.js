const express = require('express');
const router = express.Router();
const posts = require('../data/posts.json');

router.get('/', function(request, response, next) {
    response.json(posts);
});

router.get('/:id', function(request, response, next) {
    const post = posts.find( result => result.id == request.params.id );

    response.json(post);
});

router.get('/user/:userid', function(request, response, next){
    const list = posts.filter( result => result.userId == request.params.userid);

    response.json(list);
});

module.exports = router;