# Aenzbi System Documentation

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [System Architecture](#system-architecture)
- [Modules](#modules)
  - [User Management](#user-management)
  - [Product Management](#product-management)
  - [Inventory Management](#inventory-management)
  - [Order Management](#order-management)
  - [Sales Management](#sales-management)
  - [Invoice Management](#invoice-management)
  - [Accounting Integration](#accounting-integration)
  - [EBMS Integration](#ebms-integration)
- [Technology Stack](#technology-stack)
- [Setup Instructions](#setup-instructions)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
  - [Running the Application](#running-the-application)
  - [API Endpoints](#api-endpoints)
- [Deployment](#deployment)
- [Maintenance](#maintenance)
- [Security Considerations](#security-considerations)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

---

## Overview
The Aenzbi System is a comprehensive solution for managing business operations. It integrates a CRM, POS, and ERP with functionalities for inventory, sales, invoicing, and external service integrations. 

**Primary Use Cases:**
- Retail and restaurant management
- Digital invoicing and real-time stock updates
- Integration with EBMS for tax compliance and reporting

## Features
- **User Management:** Role-based access control and authentication.
- **Product and Inventory Management:** Track products, stock levels, and reorder points.
- **Sales and Invoicing:** Real-time invoicing with printable receipts.
- **External Integrations:** EBMS API integration for tax reporting.
- **Accounting Module:** Basic accounting functions integrated with sales and purchases.

## System Architecture
- **Frontend:** Developed in Next.js with responsive design.
- **Backend:** Node.js API with Express for RESTful endpoints.
- **Database:** PostgreSQL (for relational data) with Firebase Functions for real-time data.
- **External API:** EBMS API integration for invoice and stock movement posting.

## Modules

### User Management
- **Description:** Handles user registration, login, and role-based access control.
- **Endpoints:**
  - `POST /auth/register` - Register a new user
  - `POST /auth/login` - User login
  - `GET /auth/logout` - Logout current session

### Product Management
- **Description:** Manage product catalog, descriptions, categories, and pricing.
- **Endpoints:**
  - `POST /products` - Add a new product
  - `GET /products` - List all products
  - `PUT /products/:id` - Update product details
  - `DELETE /products/:id` - Delete a product

### Inventory Management
- **Description:** Monitor stock levels and manage stock movement.
- **Endpoints:**
  - `GET /inventory` - View stock levels
  - `POST /inventory/add` - Add new stock by purchase or transfer
  - `POST /inventory/remove` - Reduce stock based on sales or other adjustments

### Order Management
- **Description:** Create, view, and manage orders and customer details.
- **Endpoints:**
  - `POST /orders` - Place a new order
  - `GET /orders` - View all orders
  - `PUT /orders/:id` - Update order status or details
  - `DELETE /orders/:id` - Cancel an order

### Sales Management
- **Description:** Track and record sales transactions.
- **Endpoints:**
  - `POST /sales` - Record a new sale
  - `GET /sales` - View sales history
  - `GET /sales/:id` - View specific sale details

### Invoice Management
- **Description:** Generate invoices, view and print for customers.
- **Endpoints:**
  - `POST /invoices` - Generate a new invoice
  - `GET /invoices` - List all invoices
  - `GET /invoices/:id` - Retrieve a specific invoice
  - `POST /invoices/post` - Post invoice data to EBMS

### Accounting Integration
- **Description:** Track income and expenses, integrate with invoicing and sales.
- **Endpoints:**
  - `POST /accounting/entry` - Add new accounting entry
  - `GET /accounting/ledger` - View ledger entries
  - `GET /accounting/reports` - Generate reports

### EBMS Integration
- **Description:** Real-time integration with EBMS for regulatory compliance.
- **Endpoints:**
  - `POST /ebms/invoice` - Post invoice data to EBMS
  - `POST /ebms/stock` - Post stock movement data to EBMS

## Technology Stack
- **Frontend:** Next.js
- **Backend:** Node.js, Express
- **Database:** PostgreSQL, Firebase Functions
- **Deployment:** Google Cloud Platform, Firebase Hosting

## Setup Instructions

### Prerequisites
- **Node.js** and **npm** installed
- **PostgreSQL** database instance
- **Firebase Account** for Functions and Hosting

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/AllyElvis/aenzbi.git
   cd aenzbi
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Configure environment variables:
   ```plaintext
   DATABASE_URL=<Your-Database-URL>
   EBMS_API_URL=https://ebms.obr.gov.bi:9443/ebms_api
   EBMS_TOKEN=<Your-EBMS-Token>
   ```

## Usage

### Running the Application
1. Start the server:
   ```bash
   npm start
   ```
2. Access the app at `http://localhost:3000`.

### API Endpoints
A Postman collection of API endpoints is available in the repository:
- **Base URL:** `http://localhost:3000/api`
- **Authentication Required:** For all endpoints, use Bearer token auth.

## Deployment

### Google Cloud (GCP)
1. Setup Google Cloud project and deploy via Firebase Functions.
2. Configure Firebase Hosting for the frontend.

### Firebase Functions
1. Deploy backend functions:
   ```bash
   firebase deploy --only functions
   ```

## Maintenance
- **Database Backups:** Schedule regular PostgreSQL backups.
- **Dependency Updates:** Use `npm update` to manage package updates.
- **Logs and Monitoring:** Enable monitoring for real-time logging and alerts.

## Security Considerations
- **Access Control:** Ensure sensitive routes are accessible only by authorized roles.
- **Data Encryption:** Encrypt sensitive data before storing in the database.
- **Rate Limiting:** Implement rate limiting to prevent abuse of public endpoints.

## Troubleshooting
- **Database Connection Errors:** Verify `DATABASE_URL` is correctly configured.
- **API Errors with EBMS:** Check EBMS API URL and token validity.
- **Deployment Issues:** Review Google Cloud and Firebase logs for error messages.

## Contributing
To contribute:
1. Fork the repository.
2. Create a new branch for your feature.
3. Submit a pull request with a description of changes.

## License
This project is licensed under the MIT License.

--- 
