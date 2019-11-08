<template>
    <div>
        <!-- 主体 -->
        <div class="container-fluid p-0 pt-4">
            <!-- 上部分 -->
            <div class="row hupper">
                <!-- 中间 -->
                <h6 class="huptxt">宠物之家欢迎您~</h6>
                <!-- 右侧 -->
                <div class="hupleft">
                    <ul id="d1" class=" hupul">
                        <li>
                            <router-link :to="{path:'/login'}">登录</router-link>
                        </li>
                        <li class="hupline">|</li>
                        <li>
                            <router-link :to="{path:'/reg'}">注册</router-link>
                        </li>
                    </ul>
                    <ul id="d2" class=" hupul" >
                        <li>
                            <span class="text-success ">欢迎<span class="my_bigger px-2">{{this.uname}}</span></span>
                        </li>
                        <li class="hupline">|</li>
                        <li>
                            <a href="javascript:;" @click="gotocart" >
                                <img src="../assets/img/header/shop_car1.png" alt="" title="我的购物车" class="px-3"/>
                            </a>
                        </li>
                        <li class="hupline">|</li>
                        <li>
                            <a href="javascript:;" @click="signout" class="text-muted px-2">注销</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 中部分 -->
            <div class="hbet row m-0">
                <!-- 左侧logo图 -->
                <div class="hbetlogo col-2 p-0">
                    <router-link :to="{path:'/index'}">
                        <img class="logo" src="../assets/img/header/logo.png" alt="">
                    </router-link>
                </div>
                <!-- 中间搜索框 -->
                <div class="hbetinput offset-3 col-4 p-0">
                    <input type="text" placeholder="请输入关键词搜索" v-model="kw" @keydown.13="search" @blur="search">
                </div>
                <!-- 右侧练习QQ-微信-二维码 -->
                <div class="hbetdown col-2 p-0">
                    <!-- QQ-WX -->
                    <!-- <div class="hbettxt">
                        <h4>QQ:5645613165</h4>
                        <h4>WX:5645613165</h4>
                    </div> -->
                    <!-- 二维码 -->
                    <div class="picture">
                        <img class="hbetimg" src="../assets/img/header/ch.png">
                    </div>
                </div>
            </div>
            <!-- 下部分 -->
            <div class="hdown">
                <ul class="hdownul">
                    <!-- 刷新页面的作用 -->
                    <li class="hdownli">
                        <router-link :to="{path:'/index'}">萌宠之家</router-link>
                    </li>
                    <li class="hdownli">
                        <router-link :to="{path:'/cats'}">喵之窝</router-link>
                    </li>
                    <li class="hdownli">
                        <router-link :to="{path:'/products'}">宠物用品</router-link>
                    </li>
                    <li class="hdownli">
                        <router-link :to="{path:'/aboutpet'}">铲屎官</router-link>
                    </li>
                    <li class="hdownli">
                        <router-link :to="{path:'/salecat'}">发布信息</router-link>
                    </li>
                    <li class="hdownli">
                        <router-link :to="{path:'/article'}">联系我们</router-link>
                    </li>
                    <li class="hdownli">
                        <router-link :to="{path:'/aboutus'}">关于我们</router-link>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            kw:"", //搜索框文本中的关键字，用于模糊查询
            uname:"",
            islogin:false
        }
    },
    methods:{
        //搜索框中点击回车，即可跳转到商品列表界面，根据kw搜索对应商品
        search(){
            this.$router.push("/products/"+this.kw)
        },
        signout(){//注销
            $("#d2").css("display","none");
            $("#d1").css("display","flex");
            this.$store.commit("signout");
            sessionStorage.removeItem('uname');
            sessionStorage.removeItem('islogin');
        },
        begin(){//页面DOM树构建完成，根据用户登陆状态判断d1,d2显示状态
            if(this.islogin){
                $("#d1").css("display","none");
                $("#d2").css("display","flex");
            }else{
                $("#d2").css("display","none");
                $("#d1").css("display","flex");
            }
        },
        gotocart(){//前往购物车
            this.$router.push("/carts")
        }
    },
    created(){
        this.kw=this.$route.params.kw;//获取地址栏中的kw值
        //刷新页面时调用，根据sessionStorage中islogin判断登录状态，并修改store中的值
        this.$store.commit("isLogin");
        //获取vuex中保存的用户信息
        var user=this.$store.getters.getUser;
        //修改data中的uname和islogin
        this.islogin=user.islogin;
        this.uname=user.uname;
    },
    mounted(){
        this.begin();
    },
    watch:{
        //如果地址栏中已经有用户输入的关键词参数kw，则自动获取到搜索文本框中保持同步
        $route(){
            this.kw=this.$route.params.kw;
        }
    }
}
</script>
<style  scoped>
/* 头部大体分为上中下三部分 */
/* 上部分css */
/* 上部分背景 */
body{margin:0;}
ul{list-style:none;}
.row{display:flex;}
/* .container-fluid{width:100%;} */
.container-fluid>.hupper{background:#FAB7DA;width:100%;height:2.5rem;}
.container-fluid>.hupper>.huptxt{line-height:2.5rem;margin:0 0 0 46%;color:#833535;}
.container-fluid>.hupper>.hupleft{line-height:2.5rem;margin-left:26.5%;}
.container-fluid>.hupper>.hupleft>.hupul{padding:0;margin:0;}
.container-fluid>.hupper>.hupleft>.hupul>.hupline{margin:0 1rem;}
.container-fluid>.hupper>.hupleft>.hupul>li>a{font-family:"Microsoft YaHei";font-size:14px;color:#833535;text-decoration:none;}
.container-fluid>.hupper>.hupleft>.hupul>li>a:hover{color:#000;font-weight:700;}
/* 中部分css */
.hbet>.hbetlogo .logo{width:5rem;margin-left:100%;cursor: pointer;}
.hbet>.hbetinput>input{
    width:50%;
    height:2.5rem;
    padding-left:1.2rem;
    border-radius:25px;
    background-color:#f5f5f5 !important;
    outline:0;border:0;
    margin-top:2rem;
    /* margin-left:15rem; */
    background:url("../assets/img/header/search.png") no-repeat 97% center;
    background-size: 10%;
}
.hbet>.hbetdown{
    padding-left:1.25rem;
    display:flex;
    justify-content: center
}
.hbet>.hbetdown>.hbettxt{
    display:flex;
    color:#FAB7DA;
    flex-direction: column;
    padding-top:1rem;
    padding-right: 0.5rem
}
/* .hbet>.hbetdown>.picture{float:left;}  */
.hbet>.hbetdown>.picture>.hbetimg{
    width:60%;
    overflow:hidden;
}

/* 下部分css */
.hdown{
    width:100%;
    /* height:3rem; */
    background:#f7f6f8;
    text-align:center;
}
.hdown>.hdownul>.hdownli{
    line-height:3rem;
    width:100%;
    height: 48px;
}
.hdown>.hdownul{
    align-items:center;
    display:flex;
    justify-content:space-around;
    margin:0 11%;
    height:68px;
}
.hdown>.hdownul>.hdownli>a{color:#333;text-decoration:none;}
/* .hdown>.hdownul>.hdownli>a>img{} */
.hdown>.hdownul>.hdownli:hover{
    background: url("../assets/img/header/cat.png") no-repeat 100% center;
    background-size: 100% 100%;
}
.hdown>.hdownul>.hdownli>a:hover{
    color:#FAB7DA; 
}
#d1{
    display:inline-block
}
#d2{
    display:none
}
</style>