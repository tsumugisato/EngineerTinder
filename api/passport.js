const passport = require("passport");
const User = require('./models/user');
const LocalStrategy = require('passport-local').Strategy;
const mongoose = require('mongoose');
console.log('hhh')
passport.use(new LocalStrategy(
    function(email, password, done) {
        console.log('gggg')
      User.findOne({ email:email }, function (err, user) {
        console.log("passport")
        if (err) { return done(err); }
        if (!user) { return done(null, false); }
        // if (!user.verifyPassword(password)) { return done(null, false); }
        return done(null, user);
      });
    }
  ));



module.exports=passport