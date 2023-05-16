var express = require('express');
var router = express.Router();

const productController = require("../controllers/modules/product");

router.get('/exhibit', productController.getProductExhibit);
router.post('/pages', productController.getProductPages);
router.get('/detail/:id', productController.getProductDetail);

module.exports = router;
