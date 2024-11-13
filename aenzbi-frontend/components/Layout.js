import React from 'react';

const Layout = ({ children }) => (
  <div>
    <header>
      <nav>
        <ul>
          <li><a href="/">Home</a></li>
          <li><a href="/login">Login</a></li>
          <li><a href="/products">Products</a></li>
        </ul>
      </nav>
    </header>
    <main>{children}</main>
  </div>
);

export default Layout;
