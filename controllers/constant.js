const obj = {
    DEFAULT_SUCCESS: {
        code: 200,
        message: '请求成功'
    },
    DEFAULT_ERROR: {
        code: 500,
        message: '系统错误'
    },
    // 定义错误返回-缺少必要参数
    LACK: (param) => {
        return {
            code: 2000,
            data: false,
            message: `缺少必要参数(${param ? param : ''})`
        }
    },
    // 定义错误返回-Token验证失败
    TOKEN_ERROR: {
        code: 401,
        message: 'Token不存在或已丢失！'
    },
    /* 
        1000~1999：用户模块错误码
    
        2000~2999：权限模块错误码
    
        3000~3999：商品模块错误码
    
        4000~4999：订单模块错误码
    
        5000~5999：支付模块错误码 
    */
    LOGIN_ERROR: {
        code: 1001,
        message: '用户名或密码错误'
    },
    SHOP_CART_ERROR: {
        code: 3001,
        message: '修改购物车错误'
    },
    ORDER_ERROR: {
        code: 4001,
        message: '订单修改失败'
    },
    SENDCODE_ERROR: {
        code: 1002,
        message: '发送验证码频繁，请稍后再进行发送。'
    }
}

module.exports = obj;