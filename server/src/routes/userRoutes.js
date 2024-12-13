const express = require('express');
const { registerUser, loginUser, getTotalUsuarios } = require('../controllers/userController.js');

const router = express.Router();


router.post('/register', registerUser);
router.post('/login', loginUser);
router.get('/usuarios', getTotalUsuarios);

module.exports = router;
