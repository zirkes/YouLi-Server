// 本文件用于存储常用或者复用调取prisma模型修改或查询数据的方法

const Common = require("../common");
const Constant = require("../constant");

// 增、删、改   <批量>      批量增加需要excel表格导出导入
const obj = {
    pageList,
    addData,
    updateData,
    deleteData,
    viewData
}
module.exports = obj

/* 
分页查询
@parmas req: 请求体
@params prismaObj: 
@params searchParams: Object 附加的查询参数
*/
async function pageList(req, prismaObj, searchParams = null) {
    try {
        let result = Common.clone(Constant.DEFAULT_SUCCESS);       // 克隆一个成功类型的对象
        // 检查分页查询传递的参数 pageIndex,pageSize
        const flag = Common.checkParams(req.query, ['pageIndex', 'pageSize']);
        if (!flag.data) throw flag
        // 转换为Number类型
        let pageIndex = parseInt(req.query.pageIndex);
        let pageSize = parseInt(req.query.pageSize);

        let skip = (pageIndex - 1) * pageSize

        if (searchParams?.name) {
            searchParams.OR = [
                {
                    name: {
                        contains: searchParams.name?.toLowerCase()
                    }
                },
                {
                    detail: {
                        contains: searchParams?.detail?.toLowerCase()
                    }
                }
            ]
            delete searchParams.name;
            delete searchParams.detail;
        }
        const orderBy = searchParams ? {
            [searchParams.created_at ? 'created_at' : 'price']: searchParams.created_at ?? searchParams.price
        } : {};
        delete searchParams?.price
        delete searchParams?.created_at

        const [data, count] = await Promise.all([
            prismaObj.findMany({
                skip,            // skip: 为跳过的数据列表数
                take: pageSize,  // take: 查询出的数据列表数
                where: searchParams ? searchParams : {},
                orderBy
            }),
            prismaObj.count({
                where: searchParams ? searchParams : {}
            })
        ])

        let pageTotal = Math.ceil(count / pageSize);     // 总页数
        result.data = {
            pagePre: Math.max(pageIndex - 1, 1),    // 上一页 
            pageIndex,      // 当前页
            pageNext: Math.min(pageIndex + 1, pageTotal),   // 下一页
            pageSize,       // 每页容量大小
            pageTotal,      // 总页数
            count,          // 数据总数
            list: data,
        }
        return result;
    } catch (err) {
        return Common.errorFn(err);
    }
}

/* 
添加一条数据
@params req:Object 请求体
@params params:Array 检测必须传递的参数
@params prisma: 传递的prisma模型操作对象
*/
async function addData(req, params, prismaObj) {
    try {
        let result = Common.clone(Constant.DEFAULT_SUCCESS);

        const flag = Common.checkParams(req.body, params);
        if (!flag.data) throw flag

        const data = await prismaObj.create({
            data: req.body
        })
        result.data = true;

        return result;
    } catch (err) {
        return Common.errorFn(err);
    }
}


/* 
更新（修改）一条数据
@params req:Object 请求体
@params param:String 检测必须传递的参数(更新操作多数为表的主键id)
@params prisma: 传递的prisma模型操作对象
*/
async function updateData(req, param, prismaObj) {
    try {
        let result = Common.clone(Constant.DEFAULT_SUCCESS);

        const flag = Common.checkParams(req.query, [param]);
        if (!flag.data) throw flag

        const data = await prismaObj.update({
            where: {
                [param]: parseInt(req.query[param])
            },
            data: req.body
        })

        result.data = true;
        return result;
    } catch (err) {
        return Common.errorFn(err);
    }
}

/* 
删除一条数据
@params req:Object 请求体
@params param:String 检测必须传递的参数
@params prisma: 传递的prisma模型操作对象
*/
async function deleteData(req, param, prismaObj) {
    try {
        let result = Common.clone(Constant.DEFAULT_SUCCESS);

        const flag = Common.checkParams(req.query, [param]);
        if (!flag.data) throw flag

        const data = await prismaObj.delete({
            where: {
                [param]: parseInt(req.query[param])
            }
        })

        result.data = true;
        return result;
    } catch (err) {
        return Common.errorFn(err);
    }
}

/* 
根据Id查看一条数据
@params req:Object 请求体
@params param:String 检测必须传递的参数
@params prisma: 传递的prisma模型操作对象
*/
async function viewData(req, param, prismaObj) {
    try {
        let result = Common.clone(Constant.DEFAULT_SUCCESS);

        const flag = Common.checkParams(req.params, [param])
        if (!flag.data) throw flag

        const data = await prismaObj.findUnique({
            where: {
                [param]: parseInt(req.params.id)
            }
        })

        result.data = data;
        return result;
    } catch (err) {
        return Common.errorFn(err);
    }
}