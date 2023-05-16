var express = require('express');
var router = express.Router();

const categoryController = require("../controllers/modules/category");

router.post('/list', categoryController.getCategoryList);
router.get('/specGroup/:id', categoryController.specGroupList);
router.post('/add', categoryController.addCategory);
router.put('/update', categoryController.updateCategory);
router.delete('/delete', categoryController.deleteCategory);

module.exports = router;
