const passport = require('passport');
const User = require('../models/user')


module.exports={
    // local:async(req,res,next)=>{
    //     passport.authenticate('local', { failureRedirect: '/login' })
    //     next()
    // },
    // local:(passport)=>{
    //     passport.use(new LocalStrategy(
    //         function(name, password, done) {
    //           User.findOne({ name: name }, function (err, user) {
    //             if (err) { return done(err); }
    //             if (!user) { return done(null, false); }
    //             if (!user.verifyPassword(password)) { return done(null, false); }
    //             return done(null, user);
    //           });
    //         }
    //       ));
    // }
    checkAuthentication:(req,res,next)=>{
        if(req.isAuthenticated()){
            //req.isAuthenticated() will return true if user is logged in
            next();
        } else{
            res.redirect("/login");
        }

    }
}