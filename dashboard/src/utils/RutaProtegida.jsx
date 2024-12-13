import { Navigate } from "react-router-dom";


// eslint-disable-next-line react/prop-types
const RutaProtegida = ({children}) => {
    const auth = localStorage.getItem('auth'); 

    return auth ? children : <Navigate to="/" />; // Si esta autenticado, renderiza el componente. Si no, redirige al login.
}

export default RutaProtegida