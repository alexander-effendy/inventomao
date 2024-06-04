const { Pool } = require('pg');
const dotenv = require('dotenv');

dotenv.config();

// const pool = new Pool({
//   user: process.env.DB_USER,
//   host: process.env.DB_HOST,
//   database: process.env.DB_NAME,
//   password: process.env.DB_PASSWORD,
//   port: process.env.DB_PORT,
// });

const pool = new Pool({
  user: process.env.PGUSER,
  host: process.env.PGHOST,
  database: process.env.DB_NAME,
  password: process.env.PGPASSWORD,
  port: process.env.PGPORT,
  connectionString: process.env.DATABASE_URL
});

module.exports = pool;



