const express = require('express');
const userController = require('../controller/user-controller');


const publicRouter = new express.Router();
publicRouter.post('/api/auth/register', userController.register);
publicRouter.post('/api/auth/login', userController.login);


module.exports = publicRouter