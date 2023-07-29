const express = require('express');
const router = express.Router();
const photos = require('../data/photos.json');

router.get('/', async function(request, response, next) {
    response.json(photos);
});

router.get('/:id', async function(request, response, next) {
    const photo = await photos.find( result => result.id == request.params.id );

    response.json(photo);
});

router.get('/album/:albumid', async function (request, response, next) {
    const list = await photos.filter(result => result.albumId == request.params.albumid);

    response.json(list);
});

module.exports = router;