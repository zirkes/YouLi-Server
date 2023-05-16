var express = require('express');
var router = express.Router();

const userController = require("../controllers/modules/user");

router.post('/list', userController.getUserList);

module.exports = router;
