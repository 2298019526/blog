const express = require("express")
const path = require("path")
const app = express()

app.engine('.html', require('ejs').__express);
// 设置具体的路由
app.set('views', path.join(__dirname, 'views'));
app.set("view engine", "html")

// 设置页面路由
const indexRouter = require('./routes/index')
app.use("/", indexRouter)
const articleRouter = require('./routes/article')
app.use("/article", articleRouter)
const resourcesRouter = require('./routes/resources')
app.use("/resources", resourcesRouter)

// 设置静态资源路径
app.use("/assets", express.static(__dirname + '/assets'))

app.listen(80, () => {
    console.log(`Example app listening on port 80`)
})