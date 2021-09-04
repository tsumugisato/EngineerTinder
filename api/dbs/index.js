'use strict'

const mongoose = require('mongoose');
require('dotenv').config

module.exports = async() => {
    try{
        const conn = await mongoose.connect(process.env.MONGO_URI,{
            useNewUrlParser: true,
            useUnifiedTopology: true,
            useUnifiedTopology: true,
        })
        return conn
    }catch(err){
        console.log(process.env.PORT)
       console.log(err,'err22222222222222222')
       process.exit(1)
    }
}