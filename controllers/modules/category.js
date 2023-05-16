const Prisma = require("../../prisma/db");
const Common = require("../common");
const Constant = require("../constant");
const Utils = require("./utils");

const exportObj = {
    getCategoryList,
    specGroupList,
    addCategory,
    updateCategory,
    deleteCategory
}
module.exports = exportObj;

async function getCategoryList(req, res) {
    res.json(await Utils.pageList(req, Prisma.category));
}

async function specGroupList(req, res) {
    try {
        const result = Common.clone(Constant.DEFAULT_SUCCESS);

        const data = await Prisma.category.findMany({
            where: {
                parentId: parseInt(req.params.id)
            }
        })
        res.json({
            ...result,
            data: {
                parentId: req.params.id,
                list: data
            }
        })
    } catch (err) {
        res.json(Common.errorFn(err));
    }
}

async function addCategory(req, res) {
    res.json(await Utils.addData(req, ['category', 'cateRank', 'parentId'], Prisma.category))
}

async function updateCategory(req, res) {
    res.json(await Utils.updateData(req, 'cateId', Prisma.category))
}

async function deleteCategory(req, res) {
    res.json(await Utils.deleteData(req, 'cateId', Prisma.category))
}