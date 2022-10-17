const express = require("express")
const router = express.Router();

router.get("/",(req,res) => {
    res.render("index", {
        title: "首页",
        style: 'index'
    })
})

module.exports = router