const User = require('../models/user')


module.exports = {
    users:async(req,res,next)=>{
    //    const {email,password,name} = req.body
    //    console.log(email,'email');
       res.send('user login')
    },

    user:async(req,res,next)=>{

    },

    sign:async(req,res,next)=>{

    }
}