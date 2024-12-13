// routes/asistenciaRoutes.js
const express = require('express');
const { obtenerAsistencias } = require('../controllers/asistenciaController');
const {obtenerConteoDocumentos} = require('../controllers/estadisticasController')
const router = express.Router();

// Ruta para obtener las asistencias
router.get('/asistencias', obtenerAsistencias);

//ruta para obtener las estaditicas
router.get('/estadisticas', obtenerConteoDocumentos)

module.exports = router;
