const express = require("express")
const router = express.Router();

const { getArticleData } = require('../controllers/common')

router.get("/",async (req,res) => {
    const articleList = await getArticleData()
    console.log(articleList)
    res.render("index", {
        title: "首页",
        style: 'index',
        articleList
    })
})

module.exports = router