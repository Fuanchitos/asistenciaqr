/* eslint-disable react/prop-types */
import { useState } from "react";
import UserForm from "./UserForm";
import '../styles/db-conector.css';

const initialUserState = {
  name: '',
  mail: '',
  password: ''
};

const DBConector = ({ enviarDatos }) => {
  const [usuario, setUsuario] = useState(initialUserState);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setUsuario((prevUsuario) => ({
      ...prevUsuario,
      [name]: value,
    }));
  };

  return (
    <div className="container">
      <div className="dashboardContent">
        <h1>Registro</h1>
        <UserForm usuario={usuario} handleInputChange={handleInputChange} enviarDatos={(e) => enviarDatos(e, usuario, setUsuario)} />
      </div>
    </div>
  );
};

export default DBConector;
