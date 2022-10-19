const express = require("express")
const router = express.Router();

const article = require("./article")
for(let key in article){
    let item = article[key]
    router[item.methods?item.methods:"get"](item.path,item.action)
}


module.exports = router