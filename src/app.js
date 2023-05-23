const express = require('express');
const path = require('path');
const morgan = require('morgan');
const app = express();

// importing routes
const usuarioRoutes = require('./routes/usuario');

//settings
app.set('port', process.env.PORT || 3000);
app.set('view engine', 'ejs');
app.set('views', path.join (__dirname,'views'));

//middlewares
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({extended: false}));

//routes
app.use('/', usuarioRoutes);

// static files
app.use(express.static(path.join(__dirname,'public')));

app.listen(app.get('port'), ()=> {
    console.log('Server on port ', app.get('port'));
});