const db = require("../db")


// article接口
module.exports = {
    indexArticleList: {
        methods: "get",
        path: "/article/getIndexArticleList",
        action: (req,res) => {
            // db.query("")
            // console.log(req);
            let { page,pageSize,tagId } = req.query;
            
            res.send({
                status: 0,
                data: "success",
                msg: "这里是getIndexArticleList",
            })
        }
    }
}