const express = require('express');
const router = express.Router();
const comments = require('../data/comments.json');

router.get('/', function(request, response, next) {
    response.json(comments);
});

router.get('/:id', function(request, response, next) {
    const comment = comments.find( result => result.id == request.params.id );

    response.json(comment);
});

router.get('/post/:postid', function(request, response, next){
    const list = comments.filter( result => result.postId == request.params.postid);

    response.json(list);
});

module.exports = router;