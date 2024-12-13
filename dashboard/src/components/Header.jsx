import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faRightFromBracket } from '@fortawesome/free-solid-svg-icons';
import { Link, useNavigate } from "react-router-dom";
import '../styles/header.css'; 

const Header = () => {

  const navigate = useNavigate(); // Hook para redirigir

  const handleLogout = () => {
    // Elimina el estado de autenticación de localStorage
    localStorage.removeItem('auth');
    // Redirige al login
    navigate('/login');
  };
  return (
    <header className="header-container">
      <nav className="nav-bar">
        <ul className="nav-links">
          
          {/* <li><Link to='/'>Inicio</Link></li> */}
          <li><Link to='/'>Acceso</Link></li>
          {/* <li><Link to='/page'>Registro</Link></li> */}
          <li><Link to='/consult'>Consulta</Link></li>
        </ul>
      </nav>
      <Link to='/'>
      <FontAwesomeIcon icon={faRightFromBracket} style={{color: "#edf2f4"}} size="2x" onClick={handleLogout}/>
      </Link>
    </header>
  );
}

export default Header;
