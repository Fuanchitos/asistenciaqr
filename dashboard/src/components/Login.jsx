import { useState } from 'react';
import '../styles/login.css'
import { useNavigate } from 'react-router-dom';

const Login = () => {

const [mail, setMail] = useState('');
const [password, setPassword] = useState('');
const navigate = useNavigate();

const handleLogin = async (e) => {
    e.preventDefault();

    try {
        console.log(mail, password);
        const response = await fetch('http://localhost:3000/api/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ mail, password }),
        });

        const data = await response.json();
        if (data.success) {
            localStorage.setItem('auth', true); 
            navigate('/consult')
        } else {
            alert(data.message);
        }
    } catch (error) {
        console.error('Error en el login:', error);
    }
};

return (
    <div>
        <div className="form-container">
            <h2 className="form-title">Iniciar sesión</h2>
            <form  className="form-space" onSubmit={handleLogin}>
                <div className="form-group">
                    <label htmlFor="correo" className="form-label">Correo electrónico:</label>
                    <input
                        required
                        id="correo"
                        className="form-input"
                        type="email"
                        placeholder="email@example.com"
                        value={mail}
                        onChange={(e) => setMail(e.target.value)}
                    />
                </div>
                <div className="form-group">
                <label className="form-label">Contraseña:</label>
                <input
                    required
                    className="form-input"
                    type="password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                />
                </div>
                <div className="form-button-container">
                <button className="form-button" type="submit" >
                    Enviar
                </button>
                </div>
            </form>
        </div>
    </div>
)
}

export default Login