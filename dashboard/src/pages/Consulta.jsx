import { useEffect, useState } from 'react';
import { Bar, Line, Doughnut } from 'react-chartjs-2';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUsers, faLayerGroup, faPerson, faPersonDress } from '@fortawesome/free-solid-svg-icons';
import '../styles/consult.css';

import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
  LineElement,
  PointElement,
  ArcElement,
} from 'chart.js';


ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
  LineElement,
  PointElement,
  ArcElement
);

const Consulta = () => {
  const [data, setData] = useState([]);
  const [qrCode, setQrCode] = useState(null); 
  const [estadisticas, setEstadisticas] = useState({ totalAsistencias: 0, totalUsuarios: 0 });


  // Obtener datos de asistencia
  useEffect(() => {
    fetch('http://localhost:3000/api/asistencias')
      .then((response) => response.json())
      .then((datos) => setData(datos))
      .catch((error) => console.error('Error al obtener datos:', error));
  }, []);

  // Generar QR
  useEffect(() => {
    const fetchQRCode = async () => {
      try {
        const response = await fetch('http://localhost:3000/api/generate-qr');
        if (!response.ok) throw new Error('Error al obtener el QR');

        const data = await response.json();
        setQrCode(data.qrCode); 
      } catch (error) {
        console.error('Error al generar el QR:', error);
      }
    };

    fetchQRCode(); 
  }, []);

  useEffect(() => {
    const fetchEstadisticas = async () => {
      try {
        const response = await fetch('http://localhost:3000/api/estadisticas'); 
        const data = await response.json();
        setEstadisticas(data);
      } catch (error) {
        console.error('Error al obtener estadísticas:', error);
      }
    };

    fetchEstadisticas();
  }, []);


  const ultimosTres = data.slice(-3);

  // Datos para el grafico de barras
  const barData = {
    labels: data.map((item) => item.evento_id),
    datasets: [
      {
        label: 'Asistencias',
        data: data.map((item) => item.cantidadConfirmados),
        backgroundColor: [
          '#FF99C8',
          '#FCF6BD',
          '#D0F4DE',
          '#A9DEF9',
          '#E4C1F9',

        ],
      },
    ],
  };

  // Datos para el grafico de líneas
  const lineData = {
    labels: data.map((item) => item.evento_id),
    datasets: [
      {
        label: 'Asistencias',
        data: data.map((item) => item.cantidadConfirmados),
        borderColor: '#8884d8',
        borderWidth: 2,
        fill: false,
        tension: 0.3,
      },
    ],
  };

  // Datos para el grafico de dona
  const doughnutData = {
    labels: ultimosTres.map((item) => item.evento_id),
    datasets: [
      {
        label: 'Asistencias',
        data: ultimosTres.map((item) => item.cantidadConfirmados),
        backgroundColor: ['#E4C1F9', '#A9DEF9', '#FCF6BD'],
      },
    ],
  };

  return (
    <div className="contenedor-principal">
      <aside>
        {qrCode ? (
          <img src={qrCode} alt="Código QR de consulta" className="qr-image" />
        ) : (
          <p>Cargando QR...</p>
        )}
        <h3>Descarga la App</h3>
      </aside>
      <main>
        {/* <h2>Clases</h2> */}
        <div className='head'>
          <div className='container-txt'>
          <FontAwesomeIcon icon={faLayerGroup} size="2xl" />
          <div>Clases</div>
          <p>{estadisticas.totalAsistencias}</p>
          </div>
          <div className='container-txt'>
          <FontAwesomeIcon icon={faUsers}  size="2xl"/>
          <div>Alumnos</div>
          <p>{estadisticas.totalUsuarios}</p>
            </div>
          <div className='container-txt'>
            <FontAwesomeIcon icon={faPerson} size="2xl"/>
          </div>
          <div className='container-txt'>
          <FontAwesomeIcon icon={faPersonDress} size="2xl"/>
          </div>
        </div>
        <article >
          <div className='grafico-contenedor'>
            <figure className="chart-container">
              {/* <h2>Gráfico de Barras</h2> */}
              <Bar data={barData} options={{ responsive: true }} />
            </figure>
          </div>
          <div className='grafico-contenedor'>
            <figure className="chart-container">
              {/* <h2>Gráfico de Líneas</h2> */}
              <Line data={lineData} options={{ responsive: true }} />
            </figure>
          </div>
        </article>
        <div className='grafico-contenedor'>
          <figure className="chart-dona">
            <h2>Ultimas clases</h2>
            <Doughnut data={doughnutData} options={{ responsive: true }} />
          </figure>
        </div>
      </main>
    </div>
  );
};

export default Consulta;
