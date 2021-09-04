// /backend/models/user.js

const { Int32 } = require('mongodb');
var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var User = new Schema({
    name : { type: String, require: true }, 
    old: {type:Number,required:true}, 
    sex: {type:Number,required:true}, 
    location: {type:String,required:true}, 
    experience: {type:Boolean,required:true}, 
    //一時的にpasswordがstring型になってるだけ
    password : { type: String, require: true },

    // history : { type: String, require: true },
    history : [{
        language : Number,
        history : Number,
         }]

});

module.exports = mongoose.model('user', User);