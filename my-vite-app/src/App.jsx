import { useState } from 'react'
import './App.css'

function App() {
  const [count, setCount] = useState(0)
  const [message, setMessage] = useState('Hello World!')

  return (
    <div className="App">
      <header className="App-header">
        <h1>{message}</h1>
        <p>Welcome to your React + Vite app!</p>
        
        <div className="card">
          <button onClick={() => setCount((count) => count + 1)}>
            count is {count}
          </button>
          <p>
            Click the button to test React state!
          </p>
        </div>

        <div className="message-changer">
          <input 
            type="text" 
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            placeholder="Change the message..."
          />
        </div>

        <p className="info">
          Edit <code>src/App.jsx</code> and save to test HMR
        </p>
      </header>
    </div>
  )
}

export default App
