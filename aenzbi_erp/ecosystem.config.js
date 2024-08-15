module.exports = {
  apps: [
    {
      name: 'aenzbi-erp',
      script: './server.js',
      instances: 'max',
      exec_mode: 'cluster',
      env: {
        NODE_ENV: 'production'
      },
      log_file: './logs/combined.log',
      error_file: './logs/error.log',
      out_file: './logs/combined.log',
      time: true
    }
  ]
};
