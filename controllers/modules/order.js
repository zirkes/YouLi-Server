const Prisma = require("../../prisma/db");
const Common = require("../common");
const Constant = require("../constant");
const Utils = require("./utils");

const exportObj = {
    getOrderList
}
module.exports = exportObj;

// 商品分页查询
async function getOrderList(req, res) {
    let searchParams = {};
    // for (let key in req.body) {
    //     if (key === 'keyword' || key === 'name') {
    //         searchParams['name'] = req.body[key]
    //         searchParams['detail'] = req.body[key]
    //     } else if (key === 'timeSort') {
    //         searchParams['created_at'] = req.body[key]
    //     } else if (key === 'priceSort') {
    //         searchParams['price'] = req.body[key]
    //     }
    // }
    searchParams = Object.keys(searchParams).length ? searchParams : null;
    res.json(await Utils.pageList(req, Prisma.order, searchParams));
}

