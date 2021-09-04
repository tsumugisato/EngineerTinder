const User = require('../models/user')


module.exports = {
    users:async(req,res,next)=>{
       const users = await User.find({});
       res.status(200).json(users)
    },

    user:async(req,res,next)=>{

    },

    sign:async(req,res,next)=>{

    }
}