<template>
    <div>
        <my-header></my-header>
        <main class="carts">
            <!-- 顶部复选框 标题栏 -->
            <div class="selectAll d-flex justify-content-around my-4">
                <h4>我的购物车</h4>
                <label>
                    <input type="checkbox" id="chball" @change="selectAll">全选
                </label>
            </div>
            <!-- 购物车中商品列表 -->
            <div v-for="(item,index) of carts" :key="index" class="cart-item">
                <div class="cart-txt">
                    <input type="checkbox" v-model="item.cb" @change="chbone">
                    <div class="mx-3">
                        <!-- 商品缩略图 -->
                        <img :src="`http://127.0.0.1:5050/${item.pic}`" alt="" class="my-img">
                    </div>
                    <!-- 商品名 -->
                    <div class="lname h5" v-text="item.pname"></div>
                    <!-- 商品简介 -->
                    <div v-text="item.details" class="lname"></div>
                    <!-- 商品价格 -->
                    <div v-text="`￥${item.price}`" class="lprice text-info"></div>
                    <!-- 商品数量 -->
                    <div class="d-flex justify-content-around">
                        <mt-button @click="add(-1,$event)" class="my_btn ml-3">-</mt-button>
                        <input type="text" v-model="item.count" class="lcount text-center h6" :data-i="index">
                        <mt-button @click="add(+1,$event)" class="my_btn mr-3">+</mt-button>
                    </div>
                    <div>
                        <!-- 小计 -->
                        小计：<span class="text-danger h6 ml-2">{{(item.count*item.price).toFixed(2)}}</span>
                    </div>
                    <!-- 删除商品 -->
                    <mt-button @click="delItem" :data-id="item.id" class="ml-2">删除</mt-button>
                </div>
            </div>
            <!-- 购物车中选中商品总价，删除选中商品，清空购物车，继续购物 -->
            <div class="cart-bottom">
                <mt-button @click="delItems" class="pt-2">删除选中商品</mt-button>
                <mt-button @click="clear" class="pt-2">清空购物车</mt-button>
                <p>总价：<span class="total">￥{{total.toFixed(2)}}</span></p>
            </div>
            <div class="cart-bottom">
                <mt-button @click="goto" type="primary" class="pt-2 mb-3">继续购物</mt-button>
                <mt-button @click="pay" type="danger" class="pt-2 px-5">付款</mt-button>
            </div>
            
        </main>
        <my-footer></my-footer>
    </div>
</template>
<script>
export default {
    data(){
        return {
            carts:[
                {price:0}
            ]
        }
    },
    methods:{
        load(){//页面加载时执行，用于向服务器请求获取购物车内数据
            var url="products/carts";
            this.axios.get(url).then(res=>{
                console.log(res.data)
                if(res.data.code==-1){
                    this.$messagebox("消息","用户尚未登陆")
                    .then(
                        this.$router.push("login")
                    )
                }else{
                    //获取服务器响应数据，添加一个新属性cb，用于判定当前项是否被选中
                    var pros=res.data.data;
                    for(var pro of pros){
                        pro.cb=false
                    }
                    //将新的数组赋值给data中的carts
                    this.carts=pros;
                }
            })
        },
        selectAll(e){//当全选按钮发生变化时触发，商品列表中的复选框按钮状态应和全选按钮保持一致
            var bool=e.target.checked;
            // 遍历carts,使其所有元素的cb属性与bool相同
            for(var cart of this.carts){
                cart.cb=bool;
            }
        },
        chbone(e){//当单个商品状态改变时，判断是否改变全选框的状态
            var btn=e.target;
            var bool=btn.checked;
            var chball=document.getElementById("chball");
            if(!bool){
                chball.checked=false;
            }else{
                var i=0;
                for(var cart of this.carts){
                    if(!cart.cb)
                    i++
                };
                if(i==0){
                    chball.checked=true;
                }
            }
        },
        add(i,e){
            var btn=e.target;
            var input=btn.parentNode.children[1];
            var p=input.dataset.i;
            var n=parseInt(input.value);
            if(n>=1){
                n+=i;
            }else{
                n=1;
            };
            input.value=n;
            //修改data中carts中对应商品的count为n
            this.$set(this.carts[p],'count',n)
        },
        delItem(e){//删除单个商品
            var btn=e.target;
            this.$messagebox.confirm("是否删除本商品？")
            .then(res=>{//确认删除
                var id=btn.dataset.id;
                var url="products/delItem";
                var obj={params:{id}};
                this.axios.get(url,obj).then(res=>{
                    if(res.data.code==1){
                        this.$toast("删除成功！");
                        this.load();
                        return;
                    }else{
                        this.$toast("删除失败！")
                    }
                })
            })
            .catch(err=>console.log(err))
        },
        delItems(e){//删除多个商品
            this.$messagebox.confirm("是否删除选中商品")
            .then(res=>{
                var id="";
                for(var cart of this.carts){
                    if(cart.cb){
                        id+=cart.id+","
                    }
                };
                id=id.slice(0,-1);
                if(id==""){
                    this.$messagebox("消息","请选择要删除的商品");
                    return;
                };
                var url="products/delItems";
                var obj={params:{id}};
                console.log(obj)
                this.axios.get(url,obj).then(res=>{
                    if(res.data.code==1){
                        this.$toast("删除成功！")
                        this.load();
                    }else{
                        this.$toast("删除失败！")
                    }
                })
            })
            .catch(err=>console.log(err))
        },
        clear(){//清空购物车
            for(var cart of this.carts){
                cart.cb=true;
            }
            this.delItems();
        },
        goto(){//前往商品首页
            this.$router.push("/")
        },
        pay(){//跳转到支付页面

        }
    },
    created(){
        this.load();
    },
    computed:{
        total(){
            return this.carts.filter(item=>item.cb).reduce(
                (prev,item)=>
                prev+item.count*item.price
            ,0)
        }
    }
}
</script>
<style  scoped>
/* 1、商品项目元素 */
    .carts{
        text-align: center
    }
    .carts button{cursor:pointer}
    .cart-item{
        align-items: center;/*垂直居中 */
        border-bottom: 1px solid #ccc;/*底部边框 */
        margin-top:25px;/*上外边距 */
        padding-bottom:25px;/*下内边距*/
        font-size:18px;
        padding-left:3rem
    }
    /*每行商品左侧布局*/
    .cart-txt{
        display:flex;/*子元素水平对齐 */
        align-items: center;/*垂直居中 */
    }
    /*左侧内部布局*/
    .lname,.lprice,.lcount{
        margin-left:25px;
        margin-right:25px
    }
    .lcount{
        text-align: center;
        width:50px;height:30px;
        border:0
    }
    /*全选框*/
    .selectall{
        font-size:24px;
        margin:15px;
        display:flex;
        justify-content: space-between;
        padding:0 175px
    }
    /*底部布局*/
    .cart-bottom{
        display:flex;
        justify-content:space-around;
        margin-top:25px;
        font-size: 24px
    }
    .my-img{
        width:5rem;height:5rem;
    }
    .my_btn{
        text-align: center;
        border:1px solid #000;
        height:30px;
        line-height: 30px;

    }
    .total{
        color:#f00;
    }
</style>