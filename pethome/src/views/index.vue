<template>
    <div>
        <my-header></my-header>
        <main>
            <carousel></carousel>
            <!-- 八图切换 -->
            <div class="eighttxt">
                <h4>热门猫咪</h4>
                <p>——&nbsp;&nbsp;&nbsp;&nbsp; FAVORITE PET CAT &nbsp;&nbsp;&nbsp;&nbsp;——</p>
            </div>
            <div class="eight">
                <!-- 八张图 -->
                <router-link class="eight_img" v-for="(item,index) of pets" :key="index"  :to="`/petdetails/${item.aid}`" :style="{'background-image':`url(http://127.0.0.1:5050/${item.pic})`}" :data-title="item.cname" :data-content ="`建议价格：${item.min}--${item.max}`"></router-link>
            </div>
            <!-- :style="{width:innerWidth+'px'}" :to="`/details/${item.pid}`"-->
            <!-- 商品列表页 -->
            <div class="splby" >
                <!-- 文字叙述 -->
                <div class="ninetxt">
                    <h3 class="splby_h3">萌宠之家·猫咪用品中心</h3>
                    <p class="splby_p my-3">
                        <img src="../assets/img/index/small/cat.png">&nbsp;&nbsp;&nbsp;&nbsp;
                        品质好、成本低、选择多，猫咪用品采购定制不二之选!
                        &nbsp;&nbsp;&nbsp;&nbsp;<img src="../assets/img/index/small/cat.png">
                    </p>
                </div>
                <div id="products">
                    <!-- 左侧部分 -->
                    <div class="splby_left">
                        <div class="detright">
                            <div class="icon1">
                                <img src="../assets/img/index/icon1.png" alt="">
                            </div>
                            <div class="detrightfont">
                                <h3>产品中心</h3>
                                <h4>PRODUCT CENTER</h4>
                            </div>
                        </div>
                        <div class="deteightlist">
                            <ul>
                                <h3><a href="javascript:;">宠物用品</a></h3>
                                <li><a href="javascript:;">主题装</a></li>
                                <li><router-link to="/products/猫砂">猫砂</router-link></li>
                                <li><router-link to="/products/猫砂盆">猫砂盆</router-link></li>
                            </ul>
                            <ul>
                                <h3><a href="javascript:;">宠物日常</a></h3>
                                <li><router-link to="/products/玩具">猫玩具</router-link></li>
                                <li><router-link to="/products/猫粮">猫粮</router-link></li>
                                <li><router-link to="/products/罐头">猫罐头</router-link></li>
                            </ul>
                            <ul>
                                <h3><a href="javascript:;">牵引绳</a></h3>
                            </ul>
                            <ul>
                                <h3><a href="javascript:;">旅行包</a></h3>
                            </ul>
                            <ul>
                                <h3><a href="javascript:;">猫窝</a></h3>
                            </ul>       
                        </div>
                        
                        <div class="detrightbot">
                            <div class="phoneimg">
                                <img src="../assets/img/index/phone.png" alt="">
                            </div>
                            <div class="phonebt">
                                <p>
                                    宠物用品批发热线:
                                </p>
                                <span>
                                    189-2583-3588 0769-86019318            
                                </span>
                            </div>
                        </div>
                    <!-- 左侧结尾 -->
                    </div>
                    <!-- 右侧图片 -->
                    <div class="splby_right">
                        <div class="rightnine row">
                            <div class="rightthree col-4" v-for="(item,index) of products" :key="index">
                                <div>
                                    <div class="img_box">
                                        <router-link :to="`/details/${item.pid}`"><img :src="`http://127.0.0.1:5050/${item.pic}`"></router-link>
                                    </div>
                                    <div class="nineimg">
                                        <router-link :to="`/details/${item.pid}`" v-text="item.details"></router-link>
                                    </div>
                                </div>
                                <div class="ml-1"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>       
        </main>
        <my-footer></my-footer>
    </div>
</template>
<script>
import carousel from "../components/Carousel.vue"
export default {
    data(){
        return {
            pets:[
                {cname:"",fid:0,min:0,max:0,pic:""}
            ],
            products:[]
        }
    },
    methods:{
        load(){
            var url="products/index";
            this.axios.get(url).then(res=>{
                this.pets=res.data.cutepet;
                this.products=res.data.supply;
            })
        }
    },
    created(){
        this.load()
    },
    components:{carousel}
}
</script>
<style  scoped>
ul,li{margin:0;padding:0}
a{text-decoration: none}
/* 八图切换 */
/* 文字属性 */
.eighttxt{margin:60px 0;}
.eighttxt>h4{text-align:center;font-weight:110%;}
.eighttxt>p{text-align:center;margin:15px 0 0 0;color:#999}
/* 上四图 */
/* 八图动画效果 */
.eight{position: relative;width:66%;margin:0 17%}
.eight{margin-bottom:15px;}
.eight>a{display: inline-block;text-decoration:none;}
.eight .eight_img{
	position: relative;
	width: 20%;height: 14rem;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	overflow: hidden;
	box-shadow: 0 1px 1px rgba(250, 144, 144, 0.5);
	cursor: pointer;
	bottom: 1rem;
    text-align: center
}
/* .eight .eight_img:hover{
	 opacity: 0.5; 
} */
.eight>.eight_img:first-child,.eight>.eight_img:last-child{width:40%;height:14rem;}
.eight .eight_img::after,.eight .eight_img::before{
	box-sizing: border-box;
	position: absolute;
    left:0;top:0;
	z-index: 999;
	width: 100%;height: 7rem;
	overflow: hidden;
	transition: transform .4s ease-out;
	color: #fff;
}
.eight>.eight_img:first-child::after,.eight>.eight_img:first-child::before,.eight>.eight_img:last-child::after,.eight>.eight_img:last-child::before{
	width: 100%;
}

.eight .eight_img::after{
	content: attr(data-title);
	top: 0;padding-top: 55px;
	background-color: rgba(23, 19, 19, 0.4);
	font-size: 24px;
	text-align: center;
	transform: translateY(-100%) scale(.8);
}
.eight .eight_img::before{
	content: attr(data-content);
	top: 50%;
	transform: translateY(100%) scale(.8);
	background: rgba(139, 125, 131, 0.6);
	font-size: 16px;
}
.eight .eight_img:hover::after,.eight .eight_img:hover::before{
	transform: translateY(0%) scale(1);
}
/* 八图动画效果结尾 */

/* 商品列表页 */
.splby{
    width:100%;
    margin:0 auto;
    padding: 1% 17%;
    position:relative;
    /* box-shadow: 5px 15px 50px rgba(250, 144, 144, 0.5); */
}

/* 上边两行文字 */
.splby>.ninetxt{margin:45px 0;}
.splby>.ninetxt>.splby_h3,.splby>.ninetxt>.splby_p{text-align:center;}
.splby>.ninetxt>.splby_p>img{width:21px;}
/* 左边样式 */
/* .splby_left{position:absolute;} */
#products{
    width:100%;
    display:flex;
    /* box-shadow: 0 15px 50px rgba(250, 144, 144, 0.5); */
    text-align:center
}
.detright{
	background: url("../assets/img/index/1.png") no-repeat;
	width:15rem;
	text-align: center;
	height: 8.5rem;
	padding:1.5rem 0 0 0;
	z-index: 12;
	position: relative; 
  }
  /* .deteightlist>ul>li{display:none}
  .deteightlist>ul:hover li{
      display:block;
  } */
  .icon1{
	vertical-align: top;
	display: inline-block;
	padding-top:0.8rem;
	
  }
  .detrightfont{
	display: inline-block;
	margin-left:0.5rem;
  }
  .detrightfont h3{
	color:#fff;
	font-size:24px;
	line-height: 3.5rem;
	font-weight: normal;
  }
  .detrightfont h4{
	color:#fab7da;
	font-size:16px;
	font-family: arial;
	position: relative;
  }
  .deteightlist{
	width:15rem;
	border:1px solid rgb(220,220,220);
	padding:20px 20px 0;
	background: #f3f3f3;
    text-align: center;
  }
  .deteightlist h3{
	background: url("../assets/img/index/gutou.png") no-repeat center center;
    background-size:80% 80%;
	width:180px;
	height:71px;
	line-height: 71px;
	/* padding-left:1rem; */
	margin:0 auto
	/* margin-left:-15px; */
  }
  .deteightlist h3 a:before{
	content:url("../assets/img/index/icon2.png");
	width:21px;
	height: 18px;
	margin:8px 6px 0 0;
	display: inline-block;
	vertical-align: top;
  }
  .deteightlist h3 a{
	color:#333;
	font-size:18px;
	font-weight: normal;
  }
  .deteightlist ul{
	list-style:none;
  }
  
  .deteightlist ul li a:hover,.deteightlist h3 a:hover{
      color:#FAB7DA
  }
  .deteightlist ul li a::before{
	content: url("../assets/img/index/icon3.png");
	width:6px;
	height: 6px;
	display: inline-block;
	vertical-align: top;
	margin:-3px 12px 0 0;
  }
  .deteightlist ul li{
	padding:0 0 7px;
  }
  .deteightlist ul li a{
	color:#333;
	font-size:14px;
  }
  .detrightbot{
	background: url("../assets/img/index/1.png")no-repeat;
    background-size:30rem;
	width:240px;
	padding:20px 0 0 30px;
	text-align: center;
    margin-top:1.5rem
  }
  .detrightbot img{
	vertical-align: top;
	margin-right: 6px;
	margin-top:6px;
  }
  .phoneimg{
	width:100%;
	height:4rem;
	display: inline-block;
	vertical-align: middle;
  }
  .phonebt{
	text-align: left;
	width:170px;
	margin-left:6px;
	display: inline-block;
	vertical-align: middle;
  }
  .detrightbot .phonebt p{
	font-size:16px;
	color:#ffe9cf;
	line-height: 20px;
  }
  .detrightbot .phonebt span{
	font-size:20px;
	color:#fff;
	font-family: Impact;
	display: inline-block;
	line-height: 22px;
  }


/* 右侧九张图片 */
.splby_right{
    margin-left:1.5rem;
    /* box-shadow: 0 15px 50px rgba(250, 144, 144, 0.5); */
}
/* .splby_right .rightnine{padding-top:28px;} */
.splby_right>.rightnine>.rightthree .img_box img{
    width:100%;
    transition:all .5s linear
}
.splby_right>.rightnine>.rightthree .img_box img:hover{
    transform:scale(1.2);
    }
.splby_right>.rightnine>.rightthree .img_box{
    width:100%;
    overflow:hidden;
    }
.splby_right>.rightnine>.rightthree .nineimg a{
    font-size:15px;
    line-height:3rem;
    display:block;
    width:100%;height:3rem;
    color:#333;
    text-align:center;
    background-color:#eee;
    text-decoration:none;
    }
.splby_right>.rightnine>.rightthree .nineimg a:hover{
    color:#fff;
    background-color:#FAB7DA
    }
.splby_right .rightthree{
    text-align:center;
    margin:0 0 1rem 0;
    }
</style>