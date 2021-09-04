const express = require('express');
const router = express.Router();

// Auth
const AuthController = require('./controllers/AuthController');
const UserController = require('./controllers/UserController');

// User
// const UserGetAPI = require('./controllers/UserGetAPI');
// const UserDelAPI = require('./controllers/UserDelAPI');







//Auth
router.post('/login', AuthController.login);
router.post('/logout', AuthController.logout);
router.post('/sign', AuthController.logout);

//User
router.get('/users',UserController.users)
router.get('/user/:id',UserController.user)
// router.post('/user/:id',UserGetAPI);
// router.post('/user/del',UserDelAPI);



module.exports = router;