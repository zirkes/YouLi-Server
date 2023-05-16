const Prisma = require("../../prisma/db");
const Common = require("../common");
const Constant = require("../constant");
const Utils = require("./utils");

const exportObj = {
    getProductExhibit,
    getProductPages,
    getProductDetail
}
module.exports = exportObj;

// 查看首页轮播图展示的商品
async function getProductExhibit(req, res) {
    try {
        let result = Common.clone(Constant.DEFAULT_SUCCESS);

        const data = await Prisma.product.findMany({
            where: {
                exhibit: 1
            }
        })

        result.data = {
            list: data
        };
        res.json(result);
    } catch (err) {
        res.json(Common.errorFn(err));
    }
}

// 商品分页查询
async function getProductPages(req, res) {
    let searchParams = {};
    for (let key in req.body) {
        if (key === 'keyword' || key === 'name') {
            searchParams['name'] = req.body[key]
            searchParams['detail'] = req.body[key]
        } else if (key === 'timeSort') {
            searchParams['created_at'] = req.body[key]
        } else if (key === 'priceSort') {
            searchParams['price'] = req.body[key]
        }
        // else {
        //     searchParams[key] = req.body[key]
        // }
    }
    searchParams = Object.keys(searchParams).length ? searchParams : null;
    res.json(await Utils.pageList(req, Prisma.product, searchParams));
}

// 根据id查看商品详情
async function getProductDetail(req, res) {
    res.json(await Utils.viewData(req, 'id', Prisma.product))
}

