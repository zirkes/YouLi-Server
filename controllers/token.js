const jwt = require('jsonwebtoken');
const Constant = require('./constant');
const tokenKey = "WOYAOZHUANDAQIAN";

const obj = {
    // 生成加密token
    encryptToken: (data) => {
        return jwt.sign(data, tokenKey, { expiresIn: '1d' })
    },
    decryptToken: (token) => {
        try {
            const result = jwt.verify(token, tokenKey);
            return {
                status: true,
                data: result
            }
        } catch (err) {
            return {
                status: false,
                data: err
            }
        }
    },
    inspectToken: (req, res, next) => {
        const token = req.headers.authorization;
        const result = obj.decryptToken(token);
        if (result.status) {
            next();
        } else {
            res.json(Constant.TOKEN_ERROR);
        }
    }
}

module.exports = obj;