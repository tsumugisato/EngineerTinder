/* 1. expressモジュールをロードし、インスタンス化してappに代入。*/
var express = require("express");
var app = express();
// const router = require('./routes')
const router = require('./router');
var createError = require('http-errors')
require('dotenv').config();
const PORT = process.env.PORT
const User = require('./models/user')
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;


app.use(express.json());
app.use(express.urlencoded({ extended: false }));

// app.use(function(req, res, next) {
//     res.header('Content-Type', 'application/json; charset=utf-8');
//     next();
//   });


//db_connection
// const initConnectionPool = require('./dbs/index');
// initConnectionPool().then((data)=>{
//     console.log('mongo_data_connect_______________');
// })



const User1 = {
  name: "Taro",
  password: "Taro123"
};


passport.use(new LocalStrategy(
  (username, password, done) => {
    console.log(username,'username')
    console.log(User1.password,password,'password_________________')
    if(username !== User1.name){
      // Error
      console.log('name miss')
      return done(null, false);
    } else if(password !== User1.password) {
      console.log(password,'password')
      // Error
      console.log('pass miss ')
      return done(null, false);
    } else {
      // Success and return user information.
      return done(null, { username: username, password: password});
    }
  }
));
app.use(passport.initialize());
app.use(passport.session());

app.post("/login",
 function(req,res,next){
   console.log(req.body,'req')
   passport.authenticate("local", function(err, user, info){

    // handle succes or failure
   console.log(err,'err__________________')
   console.log(user,'user________')
   console.log(info,'info_________')
  })(req,res,next); 
  res.send(200)
})

  app.post('/login', 
  passport.authenticate('local', { failureRedirect: '/add' }),
  function(req, res) {
    res.redirect('/');
  });

app.post('/',(req,res)=>{
  console.log('post req')
})

app.get('/add',(req,res)=>{
  console.log(req.body)
  console.log('request get')
  res.send('failed')
})
app.get('/posts/create', async (req, res) => {
  console.log('aaaaaa')
  const newUser = await User({
    name: '田中太郎',
    old:39,
    email:'abc@example.com',
    word:'よろしくお願いします！！！！',
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