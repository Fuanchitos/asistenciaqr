const QRCode = require('qrcode');

// Controlador para generar el QR
const generateQR = async (req, res) => {
    const data = req.query.data || 'Descarga la App'; // Puedes recibir datos dinámicos para el QR

    try {
        // Generar QR como imagen base64
        const qrCode = await QRCode.toDataURL(data);
        res.json({ qrCode });
    } catch (err) {
        res.status(500).json({ error: 'Error al generar el código QR' });
    }
};

module.exports = { generateQR };
