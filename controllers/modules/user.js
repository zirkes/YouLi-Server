const Prisma = require("../../prisma/db");
const Common = require("../common");
const Constant = require("../constant");
const Utils = require("./utils");

const exportObj = {
    getUserList
}
module.exports = exportObj;

async function getUserList(req, res) {
    res.json(await Utils.pageList(req, res, Prisma.user));
}