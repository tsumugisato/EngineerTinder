const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const User = require('../models/user')

module.exports = {
    login:async(req,res,next)=>{
        console.log("authcontroller")
        
        passport.authenticate('local'),
        
        function(req, res) {
            console.log('hello',console.log(res))
          res.redirect('/users');
        }

        //    const {email,password,name} = req.body
    //    console.log(email,'email');      
    },

    logout:async(req,res,next)=>{

    },

    sign:async(req,res,next)=>{
        User.create({
            name: req.body.name,
            email: req.body.email,
            password: req.body.password,
          },
            (error, result) => {
              if (error) { res.redirect("/users/new") }
            }
          )
    }
}