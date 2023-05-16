var express = require('express');
var router = express.Router();

const adminController = require("../controllers/modules/admin");

router.post('/login', adminController.login);

module.exports = router;
