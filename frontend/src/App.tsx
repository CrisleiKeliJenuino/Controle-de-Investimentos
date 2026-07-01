import { useEffect } from 'react';

function App() {
  useEffect(() => {
    // Fetch data from the backend API
    fetch('http://localhost:3000/data')
      .then(resp => resp.text())
      .then(data => console.log('Data from backend:', data));
      }, []);
      
      return (
        <div style={{ padding: 20 }}>
          <h1>📊 Controle de Investimentos</h1>
          <p>Sistema rodando 🚀</p>
          </div>
          );
        }
        
        export default App;