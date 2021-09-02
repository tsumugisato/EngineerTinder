/* 1. expressモジュールをロードし、インスタンス化してappに代入。*/
var express = require("express");
var app = express();
// const router = require('./routes')
const router = require('./router');
var createError = require('http-errors')
require('dotenv').config({path:'./config/.env'});
const PORT = process.env.PORT || 3000


app.use(express.json());
app.use(express.urlencoded({ extended: false }));


app.use(function(req, res, next) {
    res.header('Content-Type', 'application/json; charset=utf-8');
    next();
  });


app.use(router)

app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  res.sendStatus(err.status || 500);
});

// module.exports = app;
var server = app.listen(PORT, function(){
    console.log("Node.js is listening to PORT:" + server.address().port);
});