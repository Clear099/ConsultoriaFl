const express = require('express');
const router = express.Router();

const usuarioController = require('../controllers/usuarioController.js');

router.get('/', usuarioController.bienvenido);
router.post('/registro', usuarioController.crearUsuario);
router.post('/login', usuarioController.loguearUsuario);

module.exports = router;