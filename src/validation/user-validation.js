const Joi = require('joi')

const registerUserValidation = Joi.object({
    email: Joi.string().max(100).required(),
    name: Joi.string().max(100).required(),
    password: Joi.string().max(100).required(),
})

const loginUserValidation = Joi.object({
    email: Joi.string().max(100).required(),
    password: Joi.string().max(100).required(),
})

module.exports = {
    registerUserValidation,
    loginUserValidation
}