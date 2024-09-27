import React from 'react';
import { Link } from 'react-router-dom';

function Home() {
  return (
    <div>
      <h1>Welcome to No-Code App Maker</h1>
      <Link to="/editor">Go to Editor</Link>
    </div>
  );
}

export default Home;
