const express = require('express');
const router = express.Router();
const albums = require('../data/albums.json');

router.get('/', function(request, response, next) {
    response.json(albums);
});

router.get('/:id', function(request, response, next) {
    const album = albums.find( result => result.id == request.params.id );

    response.json(album);
});

router.get('/user/:userid', function(request, response, next){
    const _albums = albums.filter( result => result.userId == request.params.userid);

    response.json(_albums);
});

module.exports = router;