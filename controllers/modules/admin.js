const Prisma = require("../../prisma/db");
const Common = require("../common");
const Constant = require("../constant");
const Utils = require("./utils");
const Token = require("../token");

const exportObj = {
    login
}
module.exports = exportObj;

async function login(req, res) {
    try {
        let result = Common.clone(Constant.DEFAULT_SUCCESS);

        let flag = Common.checkParams(req.body, ['userName', 'password'])
        if (!flag.data) throw flag;

        const data = await Prisma.admin.findFirst({
            where: {
                adminName: req.body.userName
            }
        })
        if (data && data.adminName === req.body.userName && data.password === req.body.password) {
            let token = Token.encryptToken({ adminName: data.adminName });
            result.data = {
                status: true,
                token,
                adminInfo: data
            }
        } else {
            throw {
                code: 2003,
                data: false,
                message: "账号密码错误!"
            }
        }
        res.json(result);
    } catch (err) {
        res.json(Common.errorFn(err));
    }
}