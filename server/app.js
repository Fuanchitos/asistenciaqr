const express = require('express');
const cors = require('cors'); // Para permitir el acceso del frontend
const qrRoutes = require('./src/routes/qrRoutes'); // Importamos las rutas de QR
const userRoutes = require('./src/routes/userRoutes'); // Importamos las rutas de usuario
const asistenciaRoutes = require('./src/routes/asistenciaRoutes');


const app = express();

// Middlewares
app.use(cors()); // Habilitar CORS para peticiones desde el frontend
app.use(express.json()); // Para procesar peticiones JSON

// Rutas
app.use('/api', qrRoutes); // Prefijo para las rutas de QR
app.use('/api', userRoutes); // Prefijo para las rutas de usuario
app.use('/api', asistenciaRoutes);

module.exports = app;
