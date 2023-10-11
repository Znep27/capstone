const express = require('express')
const albumsController = require('../controllers/albums')
const router = express.Router()

router.get('/', albumsController.getAllAlbums)

router.get('/:id', albumsController.getAlbumById)

router.post('/', albumsController.createAlbum)

router.put('/:id', albumsController.updateAlbumById)

router.delete('/:id', albumsController.deleteAlbumById)

module.exports = router