const express = require("express")
const router = express.Router();

router.get("/",(req,res) => {
    res.render("resources_list", {
        title: "资源列表",
        style: 'resources'
    })
})

module.exports = router