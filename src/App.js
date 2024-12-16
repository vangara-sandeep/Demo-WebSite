import React from 'react';
import './App.css';
import io from 'socket.io-client';
import ChatApp from './components/ChatApp';

const socket = io.connect("http://localhost:8080");  // Backend WebSocket URL

function App() {
  return (
    <div className="App">
      <ChatApp socket={socket} />
    </div>
  );
}

export default App;
