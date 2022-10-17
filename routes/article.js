const express = require("express")
const router = express.Router();

router.get("/",(req,res) => {
    res.render("article_list", {
        title: "精选文章",
        style: 'article'
    })
})

module.exports = router