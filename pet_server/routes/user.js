//用户相关路由
const express=require('express');
var router=express.Router();
var pool=require('../pool.js');
//功能一：用户登录
router.get("/login",(req,res)=>{
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    var sql="select uid from pet_master where uname=? and upwd=md5(?)";
    pool.query(sql,[uname,upwd],(err,result)=>{
        if(err) throw err;
        if(result.length==0){
            res.send({code:-1,msg:"用户名或密码错误"});
        }else{
            //获取当前登录用户的uid，并保存到session对象中
            var uid=result[0].uid;
            req.session.uid=uid;
            res.send({code:1,msg:"登陆成功"})
        }
    })
})
//功能二：用户注册
router.get("/reg",(req,res)=>{
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    var email=req.query.email;
    var phone=req.query.phone;
    var gender=req.query.gender;
    console.log(uname)
    var sql="insert into pet_master values (null,?,md5(?),?,?,?)";
    pool.query(sql,[uname,upwd,email,phone,gender],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"注册成功！"})
        }else{
            res.send({code:-1,msg:"注册失败"})
        }
    })
})
//功能三：验证用户名是否已存在
router.get("/check",(req,res)=>{
    var u=req.query.uname;
    var sql="select uid from pet_master where uname=?";
    pool.query(sql,[u],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"用户名已存在"})
        }else{
            res.send({code:-1,msg:"用户名可用"})
        }
    })
})



















module.exports=router;