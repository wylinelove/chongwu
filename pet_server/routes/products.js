//商品相关路由
const express=require('express');
var router=express.Router();
var pool=require('../pool');
// 功能一：请求获取轮播图
router.get("/getbanners",(req,res)=>{
    var sql="select bid,title,pic from pet_banner";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result})
    })
})
//定义异步函数，查询数据库
function getData(sql,params){
    return new Promise(
        function(resolve,reject){
            pool.query(sql,params,(err,result)=>{
                if(err) reject(err);
                resolve(result)
            })
        }
    )
}
// 功能一：请求  首页萌宠 首页宠物用品
router.get("/index",(req,res)=>{
    var output={
        cutepet:[],
        supply:[]
    };
    var sql1="select cid,pic,cname,min,max,aid from pet_cutepet";
    getData(sql1,[]).then(result=>{
        output.cutepet=result;
        var sql2="select sid,pic,sname,details,price,pid from pet_supply";
        return getData(sql2,[]);
    }).then(result=>{
        output.supply=result;
        res.send(output);
    }).catch(err=>{throw err})
})
//功能二.一：请求宠物用品列表 分页查询 模糊查询
router.get("/list",(req,res)=>{
    var output={
        count:0,//商品总数
        pageSize:16,//每页商品数量
        pageCount:0,//页码总数
        pno:req.query.pno||0,//当前页码数
        data:[] //商品列表
    };
    var kw=req.query.kw;
    if(!kw){
        var sql=`select pid,sf_id,title,subtitle,price,details,md,is_onsale from pet_products`;
    }else{
        var kws=kw.split(" ");
        kws.forEach((elem,i,arr)=>{
            arr[i]= ` subtitle like '%${elem}%'`;
        })
        var where=kws.join(" and ");
        var sql=`select pid,sf_id,title,subtitle,price,details,md,is_onsale from pet_products where ${where}`;
    }
    getData(sql,[]).then(result=>{
        output.count=result.length;
        output.pageCount=Math.ceil(output.count/output.pageSize);
        sql+=` limit ?,?`;
        return getData(sql,[output.pageCount*output.pno,output.pageSize]);
    }).then(result=>{
        output.data=result;
        res.send(output);
    }).catch(err=>{throw err})
})//功能二.二：请求宠物列表 分页查询
router.get("/cats",(req,res)=>{
    var output={
        count:0,//商品总数
        pageSize:9,//每页商品数量
        pageCount:0,//页码总数
        pno:req.query.pno||0,//当前页码数
        data:[] //商品列表
    };
    var sql=`select aid,family_id,title,subtitle,price,details,md,is_onsale from pet_animal`;
    getData(sql,[]).then(result=>{
        output.count=result.length;
        output.pageCount=Math.ceil(output.count/output.pageSize);
        sql+=` limit ?,?`;
        return getData(sql,[output.pageCount*output.pno,output.pageSize]);
    }).then(result=>{
        output.data=result;
        res.send(output);
    }).catch(err=>{throw err})
})
//功能三：获取商品详情
router.get("/details",(req,res)=>{
    var output={
        data:{},
        others:[]
    };
    var pid=req.query.pid;
    var sql="select pid,sf_id,title,subtitle,price,details,lg,md,sm,nums,is_onsale from pet_products where pid=?";
    getData(sql,[pid]).then(result=>{
        output.data=result[0];
        var sid=output.data.sf_id;
        var sql1="select sm,md,pid,title from pet_products where sf_id=?";
        return getData(sql1,[sid])
    }).then(result=>{
        output.others=result;
        res.send(output)
    }).catch(err=>{throw err})
})
//功能四：获取宠物详情products/petdetails
router.get("/petdetails",(req,res)=>{
    var output={
        pet:{},
        pics:[]
    }
    var aid=req.query.aid;
    var sql="select aid,family_id,title,subtitle,price,aname,age,details,oldmaster,says,lg,md,sm,saletime,is_onsale,phone from pet_animal where aid=?";
    pool.query(sql,[aid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            output.pet=result[0];
            var fid=result[0].family_id;
            var sql1="select aid,lg,md,sm,title from pet_animal where family_id=?"
            pool.query(sql1,[fid],(err,reh)=>{
                if(err) throw err;
                output.pics=reh;
                res.send({code:1,msg:"查询成功",data:output})
            })
        }else{
            res.send({code:-1,msg:"查询失败"})
        }
    })
})
//功能五：将商品添加到购物车
router.get("/addcart",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var pid=req.query.pid;
    var price=req.query.price;
    var pname=req.query.title;
    var details=req.query.subtitle;
    var count=req.query.count;
    var pic=req.query.pic;
    console.log(pid,price,pname,details,pic,count,uid)
    //先查询用户是否购买过此商品
    var sql="select id from pet_pro_carts where uid=? and pid=?";
    getData(sql,[uid,pid]).then(result=>{
        if(result.length==0){//如果没买过
            var  sql=`insert into pet_pro_carts values(null,${pid},${price},'${pname}','${details}','${pic}',${count},${uid})`;
        }else{
            var sql=`update pet_pro_carts set count=count+1 where uid=${uid} and pid=${pid}`
        }
        return getData(sql,[]);
    }).then(result=>{
        if(result.affectedRows>0){
            res.send({code:1,msg:"添加成功"})
        }else{
            res.send({code:-2,msg:"添加失败"})
        }
    }).catch(err=>{
        throw err
    })
})
// 功能六：查询指定用户购物车
router.get("/carts",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var sql="select id,pid,price,pname,details,count,pic from pet_pro_carts where uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result})
    })
})
// 功能七：购物车中删除按钮
router.get("/delItem",(req,res)=>{
    var id=req.query.id;
    var sql="delete from pet_pro_carts where id=?";
    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
})
// 功能八：购物车种删除多个商品
router.get("/delItems",(req,res)=>{
    var id=req.query.id;
    var sql=`delete from pet_pro_carts where id in (${id})`;
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
})
// 功能九：获取宠物相关知识
router.get("/knowledge",(req,res)=>{
    var output={
        count:0,//总条数
        pageSize:9,//每页数量
        pageCount:0,//页码总数
        pno:req.query.pno||0,//当前页码数
        data:[] //列表
    };
    var sql="select id,title,showday,nums,details,pic from pet_msg";
    getData(sql,[]).then(result=>{
        output.count=result.length;
        output.pageCount=Math.ceil(output.count/output.pageSize);
        sql+=` limit ?,?`;
        return getData(sql,[output.pageCount*output.pno,output.pageSize]);
    }).then(result=>{
        output.data=result;
        res.send(output);
    }).catch(err=>{throw err})
})
//功能十：提交宠物寄售信息
router.get("/sale",(req,res)=>{
    var obj=req.query;
    var sql="insert into pet_salepets set ?";
    pool.query(sql,[obj],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"提交成功"})
        }else{
            res.send({code:-1,msg:"提交失败"})
        }
    })
})













module.exports=router;