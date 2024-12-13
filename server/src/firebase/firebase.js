const admin = require('firebase-admin');
const serviceAccount = require('./firebase_credentials.json');

// Inicializa Firebase Admin SDK con las credenciales
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();  // Inicializamos Firestore

// Exportamos tanto `db` como `admin`
module.exports = { db, admin };
