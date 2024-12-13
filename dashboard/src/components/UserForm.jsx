/* eslint-disable react/prop-types */

import "../styles/user-form.css";


const UserForm = ({ usuario, handleInputChange, enviarDatos }) => {
  return (
    <form onSubmit={enviarDatos}>
    <div>
      <label htmlFor="name">Nombre</label>
      <input type="text" name="name"  placeholder="Ingrese su nombre" value={usuario.name} onChange={handleInputChange} />
    </div>
    <div>
      <label htmlFor="age">Edad</label>
      <input type="number" name="age" placeholder="Ingrese su edad"  value={usuario.age} onChange={handleInputChange} />
    </div>
    <div>
      <label htmlFor="mail">Correo Electrónico</label>
      <input type="email" name="mail" placeholder="Ingrese su correo"  value={usuario.mail} onChange={handleInputChange} />
    </div>
    <div>
      <label htmlFor="mail">Contraseña</label>
      <input type="password" name="password" placeholder="Ingrese su contraseña"  value={usuario.password} onChange={handleInputChange} />
    </div>
    <div>
      <label htmlFor="major">Carrera</label>
      <select name="major"   value={usuario.major} onChange={handleInputChange}>
        <option value="Ing. Innovacion Agricola Sustentable">Ing. Innovación Agrícola Sustentable</option>
        <option value="Ing. Electromecanica">Ing. Electromecánica</option>
        <option value="Ing. Electronica">Ing. Electrónica</option>
        <option value="Ing. Gestion Empresarial">Ing. Gestión Empresarial</option>
        <option value="Ing. Industrial">Ing. Industrial</option>
        <option value="Ing. Mecatronica">Ing. Mecatrónica</option>
        <option value="Ing. Sistemas Computacionales">Ing. Sistemas Computacionales</option>
        <option value="Lic. Administracion">Lic. Administración</option>
      </select>
    </div>
    <button type="submit">Registrarse</button>
  </form>
  )
}

export default UserForm