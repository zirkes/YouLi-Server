// 本文件用于存储全局常用或者复用的方法

const {_} = require('lodash');
const Constant = require('./constant');

const obj = {
    getNowTime,
    clone,
    checkParams,
    errorFn
}

// 导出常用方法
module.exports = obj;

// 获取现在时间
function getNowTime(type = '-', time = true) {
    const date = new Date(); // 创建Date对象
    const year = date.getFullYear(); // 获取年份
    const month = addZero(date.getMonth() + 1); // 获取月份，返回值是0-11，需要加1
    const day = addZero(date.getDate()); // 获取日期
    const hour = addZero(date.getHours()); // 获取小时
    const minute = addZero(date.getMinutes()); // 获取分钟
    const second = addZero(date.getSeconds()); // 获取秒钟
    // 返回时间字符串，默认格式为'yyyy-mm-dd HH:MM:SS', 可传type和time控制返回格式
    if(time) {
        return `${year}${type}${month}${type}${day} ${hour}:${minute}:${second}`;
    } else {
        return `${year}${type}${month}${type}${day}`;
    }
}

function addZero(num) {
    if (num < 10) {
        return '0' + num;
    }
    return num;
}

/* 
克隆一个对象
@param:obj
@returns {any}
*/
function clone(obj) {
    return _.cloneDeep(obj);
}

/*
效验参数全局方法
@param params 请求的参数集
@param checkArr 需要验证的参数
return boolean || obj
*/
function checkParams(params, checkArr) {
    try {
        checkArr.forEach(item=>{
            if(!params[item]){
                throw new Error(item);
            }
        })
        return {
            code: 200,
            data: true,
            message: '传参完整。'
        };
    } catch(err) {
        return Constant.LACK(err);
    }
}

/* 
统一错误返回类型
@params err:Object 错误的类型
*/
function errorFn(err){
    let errObj = {
        code: err.code || Constant.DEFAULT_ERROR.code,
        data: err.hasOwnProperty('data') ? err.data : null,
        message: err.message || Constant.DEFAULT_ERROR.message
    }
    return errObj;
}