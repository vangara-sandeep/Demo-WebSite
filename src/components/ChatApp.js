import React, { useState, useEffect } from 'react';
import MessageList from './MessageList';
import MessageInput from './MessageInput';

const ChatApp = ({ socket }) => {
  const [messages, setMessages] = useState([]);
  const [userName, setUserName] = useState('');

  useEffect(() => {
    socket.on('receive_message', (msg) => {
      setMessages((prevMessages) => [...prevMessages, msg]);
    });
  }, [socket]);

  const handleSendMessage = (message) => {
    if (message.trim()) {
      socket.emit('send_message', { userName, message });
      setMessages((prevMessages) => [...prevMessages, { userName, message }]);
    }
  };

  return (
    <div>
      <div>
        <input
          type="text"
          placeholder="Enter your name"
          value={userName}
          onChange={(e) => setUserName(e.target.value)}
        />
      </div>
      <MessageList messages={messages} />
      <MessageInput onSendMessage={handleSendMessage} />
    </div>
  );
};

export default ChatApp;
