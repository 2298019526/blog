const mysql = require("mysql")
//建立与MySQL数据库的连接
const connection = mysql.createConnection({
    host:'127.0.0.1',          //数据库的ip地址
	user:'root',               //登录数据库的账号
	password:'',        //登录数据库的密码
	database:'blog'        //指定要操作的数据库
})
 
module.exports = {
    query: (sql, params) => {
        return new Promise((resolve, reject) => {
            connection.connect(function(connErr) {
                if (!connErr) {
                    //开始数据操作
                    connection.query(sql, params, (err, results) => {
                        if(!err){
                            resolve(JSON.parse(JSON.stringify(results)))
                        }else{
                            reject(err)
                        }
    
                        //中止连接数据库
                        connection.end((endErr) => {
                            if(endErr){
                                console.error(endErr)
                            }
                        })
                    })
                } else {
                    reject(connErr)
                }        
            })
        })
    }
}