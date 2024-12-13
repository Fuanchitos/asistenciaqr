const { db, admin } = require('../firebase/firebase.js');
const bcrypt = require('bcrypt');

// Registrar usuario
const registerUser = async (req, res) => {
    const { name, age, mail, major, password } = req.body; 
    try {
        const userDoc = await db.collection('usuarios').add({
            name,
            age,
            mail,
            major,
            password,
            createdAt: admin.firestore.FieldValue.serverTimestamp(),
        });
        res.status(201).json({ message: 'Usuario registrado exitosamente', userId: userDoc.id });
    } catch (error) {
        console.error('Error al registrar el usuario:', error);
        res.status(500).json({ error: 'Error al registrar el usuario' });
    }
};

//login
const loginUser = async (req, res) => {
    const { mail, password } = req.body;

    try {
        // Verificar credenciales con Firebase Authentication
        const userRecord = await admin.auth().getUserByEmail(mail);

        // Si llegas aquí, el usuario existe. Ahora valida las credenciales en el cliente.
        const token = await admin.auth().createCustomToken(userRecord.uid);

        res.status(200).json({
            success: true,
            message: 'Inicio de sesión exitoso',
            token, // Devuelve el token para usarlo en el cliente
        });
    } catch (error) {
        console.error('Error en el login:', error);
        res.status(401).json({ success: false, message: 'Correo o contraseña incorrectos' });
    }
};


const getTotalUsuarios = async (req, res) => {
    try {
        const snapshot = await db.collection('Usuarios').get();
        const totalUsuarios = snapshot.size; 
        res.json({ totalUsuarios });
    } catch (error) {
        console.error('Error al obtener el total de usuarios:', error);
        res.status(500).json({ error: 'No se pudo obtener el total de usuarios' });
    }
};



module.exports = { registerUser, loginUser, getTotalUsuarios };