// controllers/asistenciaController.js
const { getFirestore } = require('firebase-admin/firestore');
const db = getFirestore();

exports.obtenerAsistencias = async (req, res) => {
  try {
    const asistenciasSnapshot = await db.collection('Asistencias').get();
    const datosGrafica = [];

    for (const doc of asistenciasSnapshot.docs) {
      const confirmadosSnapshot = await db.collection(`Asistencias/${doc.id}/Confirmados`).get();
      const cantidadConfirmados = confirmadosSnapshot.size;

      const { evento_id, horaGenerada } = doc.data();
      datosGrafica.push({
        evento_id,
        horaGenerada: horaGenerada.toDate(),
        cantidadConfirmados,
      });
    }

    res.json(datosGrafica);
  } catch (error) {
    console.error('Error al obtener las asistencias:', error);
    res.status(500).send('Error al obtener los datos');
  }
};
