var express = require('express');
var router = express.Router();

const orderController = require("../controllers/modules/order");

router.post('/pages', orderController.getOrderList);

module.exports = router;
