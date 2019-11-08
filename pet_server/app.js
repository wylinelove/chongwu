//引入第三方模块
const express=require('express');
const bodyParser=require('body-parser');
const session=require('express-session');
const cors=require('cors')
//引入路由接口
//引入用户相关路由
const userRouter=require('./routes/user.js');
//引入商品相关路由
const products=require('./routes/products.js');
//创建服务器
const app=express();
//设置监听端口   部署新浪云，硬性要求必须监听5050端口
app.listen(5050);
//解决跨域问题，统一为每个请求先修改响应头信息
app.use(cors(
    {//客户端浏览器地址变化，origin也要修改成相应地址，也可以修改成*，适用所有地址
        origin:["http://127.0.0.1:8080","http://localhost:8080"],
        credentials:true
    }
));
//适用body-parser中间件
app.use(bodyParser.urlencoded(
    {extended:false}
));
//配置session
app.use(session({
    secret:"128位字符串",
    resave:true,
    saveUninitialized:true
}));
//托管静态资源到public目录下
app.use(express.static("public"));
//挂载路由
app.use('/user',userRouter);
app.use('/products',products);