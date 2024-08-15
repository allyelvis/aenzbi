# Aenzbi Global Business ERP

## Overview

Aenzbi Global Business ERP integrates POS, accounting, invoicing, inventory, and CRM modules.

## Setup

1. Clone the repository
2. Run `npm install` to install dependencies
3. Create a `.env` file with necessary environment variables
4. Run `npm start` to start the application

## Deployment

- Use Docker to build and run the application
- Configure GitHub Actions for CI/CD

## Backup

- Backup script is located in `scripts/backup_db.sh`
- Scheduled backups are set using cron jobs

## Logging

- Logs are stored in the `logs` directory
- Use Winston for logging

## Monitoring

- PM2 is used for process management and monitoring
