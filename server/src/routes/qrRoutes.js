const express = require('express');
const { generateQR } = require('../controllers/qrController');

const router = express.Router();

// Definir la ruta para generar el código QR
router.get('/generate-qr', generateQR);

module.exports = router;
