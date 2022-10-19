const res = require("express/lib/response")
const db = require("../db")

const getArticleData = async (params = {}) => {
    let result = []
    try{
        let { tagId = '',page = 1,pageSize = 10 } = params
        let index = (page - 1) * pageSize
        let sqlStr = 'select * from b_blog where blog_tags like ? and is_del=0 order by create_time desc limit ?,?;'
        result = await db.query(sqlStr, ["%"+tagId+"%",index,pageSize])
    }catch(err){
        console.error(err)
        result = []
    }
    return result
}

module.exports = {
    getArticleData
}