import React from 'react';

const MessageList = ({ messages }) => {
  return (
    <div>
      {messages.map((msg, index) => (
        <div key={index}>
          <strong>{msg.userName}:</strong> {msg.message}
        </div>
      ))}
    </div>
  );
};

export default MessageList;
