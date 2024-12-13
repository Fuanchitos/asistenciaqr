import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Login from './components/Login'
import Header from './components/Header'
import './styles/app.css'
import RutaProtegida from './utils/RutaProtegida';
// import QrGenerador from './components/QrGenerador';
import Firebase from './services/firebase';
import Consulta from './pages/Consulta';

function App() {
  return (
    <Router>
      <Header />
      <Routes>
        {/* <Route path='/' element={<QrGenerador/>}/> */}
        <Route path="/" element={<Login />} />
        <Route path="/page" element={<Firebase/>} />
          <Route path='/consult' element={
            <RutaProtegida>
              <Consulta/>
            </RutaProtegida>
              }
            />
      </Routes>

  </Router>
    
  )
}

export default App