const { getFirestore } = require('firebase-admin/firestore');
const db = getFirestore();

exports.obtenerConteoDocumentos = async (req, res) => {
  try {
    // Conteo de documentos en la colección 'Asistencias'
    const asistenciasSnapshot = await db.collection('Asistencias').get();
    const totalAsistencias = asistenciasSnapshot.size;

    // Conteo de documentos en la colección 'Usuarios'
    const usuariosSnapshot = await db.collection('Usuarios').get();
    const totalUsuarios = usuariosSnapshot.size;

    // Enviar el conteo como respuesta
    res.json({
      totalAsistencias,
      totalUsuarios,
    });
  } catch (error) {
    console.error('Error al obtener el conteo de documentos:', error);
    res.status(500).json({ error: 'Error al obtener el conteo de documentos' });
  }
};
