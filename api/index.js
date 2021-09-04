/* 1. expressモジュールをロードし、インスタンス化してappに代入。*/
var express = require("express");
var app = express();
// const router = require('./routes')
const router = require('./router');
var createError = require('http-errors')
require('dotenv').config();
const PORT = process.env.PORT
const User = require('./models/user')


app.use(express.json());
app.use(express.urlencoded({ extended: false }));


app.use(function(req, res, next) {
    res.header('Content-Type', 'application/json; charset=utf-8');
    next();
  });


//db_connection
const initConnectionPool = require('./dbs/index');
initConnectionPool().then((data)=>{
    console.log('mongo_data_connect_______________');
})





app.get('/posts/create', async (req, res) => {
  console.log('aaaaaa')
  const newUser = await User({
    name: '田中太郎',
    old:39,
    sex:1,
    location:"東京都",
    experience:true,
    password:"sample_password",
    history:[
      {language:2,history:7},
      {language:22,history:2},
      {language:6,history:8},
      {language:3,history:9},
    ]
  });
  await newUser.save();
  res.status(200).json(newUser);
});

app.use(router)

app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  console.log(process.env.PORT)
  res.sendStatus(err.status || 500);
});

// module.exports = app;
var server = app.listen(PORT, function(){
    console.log("Node.js is listening to PORT:");
});