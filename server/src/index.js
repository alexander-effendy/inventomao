const express = require('express');
const bodyParser = require('body-parser');
const session = require('express-session');
const passport = require('passport');
const dotenv = require('dotenv');
const auth = require('./auth');
const pool = require('../db');
const { append } = require('vary');




dotenv.config();

const app = express();

app.use(bodyParser.json());

app.use(session({
  secret: process.env.SESSION_SECRET,
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false } // cuz now http later https set to true ez
}));

app.use(passport.initialize());
app.use(passport.session());

app.use((req, res, next) => {
  req.db = pool;
  next();
});

app.use('/auth', auth); // use this first then /profile

app.get('/', (req, res) => {
  res.send('Welcome to the InventoMao app!');
});

/ ---------------------------------------------------------------------- //
// -------------------------------- USER -------------------------------- //
// ---------------------------------------------------------------------- //

app.get('/profile', (req, res) => {
  console.log('Authenticated:', req.isAuthenticated());
  // console.log(req);
  if (req.isAuthenticated()) {
    res.json(req.user);
  } else {
    res.status(401).send('Unauthorized');
  }
});


const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});