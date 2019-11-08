<template>
    <div>    
    <my-header></my-header>
    <main class="page">
      <!-- 左侧主体 -->
      <div class="detailsleft">
        <!-- 左侧头部 -->
        <div class="detleft-top">
          <router-link to="/index">首页</router-link> >
          <a href="javascript:;">宠物用品</a> >
          <a href="javascript:;">{{details.title}}</a>
        </div>
        <!-- 左侧图片大div -->
        <div class="detimg">
          <div id="lg-img" v-show="vilibi" :style="{'background-image':`url(http://127.0.0.1:5050/${details.lg})`,'background-position':lgposition}"></div>
          <div class="img-left">
            <!-- 中型图片 鼠标悬浮缩放1.2倍  添加放大镜效果 -->
            <div class="md-img">
              <img :src="`http://127.0.0.1:5050/${details.md}`" alt="">
              <div id="mask" class="zhezhaocheng" v-show="vilibi" :style="maskstyle"></div>
              <div id="super-mask" @mouseover="toggle" @mouseout="toggle" @mousemove="drag"></div>
              
            </div>
            <!-- 小图片 需要重改 下面小图片会自动移动，-->
            <div class="small-img" @mouseover="change">
              <ul class="clearboth">
                <li v-for="(item,i) of others" :key="i"> 
                  <img :src="`http://127.0.0.1:5050/${item.sm}`" alt="">
                   
                </li>
              </ul>
            </div>
          </div>
          <!-- 图片右侧详情 -->
          <div class="img-right">
            <div class="imgrightdet">
              <ul>
                <li><h5 v-text="details.subtitle" class="text-primary"></h5></li>
              </ul>
            </div>
            <div class="product">
              <div class="buycount d-flex mr-4">
                <div>单价：</div>
                <span class="px-5 h4 text-warning">￥{{details.price.toFixed(2)}}</span>
              </div>
              <div class="buycount d-flex mr-4">
                <div>库存：</div>
                <span v-text="details.nums" class="px-5"></span>
              </div>
              <div class="buycount d-flex mr-4">
                <div>数量：</div>
                <div class="px-5">
                  <button @click="add(-1,$event)">-</button><input v-model="count"><button @click="add(1,$event)">+</button>
                </div>
              </div>
              <div class="buycount  d-flex mr-4">
                <div class="">规格：</div>
                <div class=" w-75">
                  <router-link v-for="(item,index) of others" :key="index" :to="`/details/${item.pid}`"  v-text="item.title" class="btn btn-sm btn-outline-secondary m-1 px-3" :class="item.pid==pid?'active':''"></router-link>
                </div>
              </div>
            </div>
            <div>
              <button class="more-click-button" @click="buy">立即购买</button>
              <button class="more-click-button" @click="addcart">加入购物车</button>
              <button class="more-click-button" @click="gotocart">前往购物车</button>
            </div>
          </div>
        </div>
        <!-- 左侧产品详细信息 -->
        <div class="detailstop">
          <h3>产品详细描述</h3>
        </div>
        <div class="chanpinxg">
          <div class="xiangguan">
            相关产品：
          </div>
          <div class="btmscoll" style="margin:0 15px;overflow:hidden">
            <ul @mouseover="stop" @mouseout="move"   id="scroll" style="position: relative;left:-200px">
              <li v-for="(item,i) of others" :key="i">
                <router-link :to="`/details/${item.pid}`"><img :src="`http://127.0.0.1:5050/${item.md}`" alt=""></router-link >
                <div>
                  <span v-text="item.title"></span>
                </div>
              </li>
            </ul>
          </div>
        </div>
        <div class="detailsbody">
          <p><span>规格尺寸：可以根据您的需要或预算订做</span></p>
          <p><span>产品系列：宠物用品、宠物三角巾，狗狗领结、狗狗铃铛、狗窝、狗垫、狗屋、狗床、狗饰品、狗饰物、狗口水巾、<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            宠物周边、宠物配件、宠物旅行包、宠物背包、宠物外出包、狗雨衣等</span>
          </p>
          <p><span>主要材质：尼龙、涤纶、帆布、PU、棉、牛仔布、毛线、腈纶、摇粒绒、珊瑚绒等</span></p>
          <p><span>风&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格：休闲风、英伦风、公主风、欧美风等等</span></p>
          <p><span>产品颜色：可按国际PANTONE定做颜色，多种颜色的可供选择</span></p>
          <p><span>产品说明：可以根据客户的要求做不同的颜色，不同的长度，不同的配件，质量好，交货准，价格优，全力满足客

            户的要求</span></p>
          <p><span>交货周期：按订货数量具体来定</span></p>
          <p><span>LOGO工艺：丝印、热转印、提花、可定制工艺；</span></p>
          <p><span>产品用途：1.适用于狗狗日常生活所需<br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.适合各商场、宠物超市，卖场以宠物商店的销售专柜</span></p>
          <p><span>产品品牌：趣逗派</span></p>
          <p><span>产品编号：QDP201701-YMX  QDP201701-1YMX</span></p>
          <p><span>产品名称：宠物条纹针织背心</span></p>
          <p><span>产品尺寸：S/M/L/XL/XXL</span></p>
          <p><span>产品颜色：灰色 粉色</span></p>
          <p><span>材质信息：cvc单面条纹针织</span></p>
          <p style="margin-bottom:40px;"><span>主要成分：35%棉+65%涤</span></p>
          <img src="../assets/img/details/2.gif" alt="" style="width:890px;height:578px;">
          <img src="../assets/img/details/3.gif" alt="" style="width:890px;height:545px;">
          <img src="../assets/img/details/1.gif" alt="" style="width:890px;height:780px;">
          <img src="../assets/img/details/4.gif" alt="" style="width:890px;height:843px;">
          <img src="../assets/img/details/5.gif" alt="" style="width:890px;height:716px;">
          <img src="../assets/img/details/6.jpg" alt="" style="width:890px;height:847px;">
          <img src="../assets/img/details/7.gif" alt="" style="width:890px;height:452px;">
          <img src="../assets/img/details/8.jpg" alt="" style="width:890px;height:281px;">
        </div>
        <div class="liucheng">
          <h4>售前咨询&nbsp;&nbsp;<span>请您将定做的产品款式，具体尺寸，数量，颜色等内容要求发图给我们的客服人员，或寄样品给我们，确定定制意向。</span></h4>
          <h4>工厂报价&nbsp;&nbsp;<span>我们会根据你提供的款式样品数量等要求，作出准确的报价。</span></h4>
          <h4>样品确认&nbsp;&nbsp;<span>报价确认后，我们会根据您的要求打样，把样品寄到您手上进一步的确认落实。打样费RMB60/件，收到正式订单后<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退回！</span></h4>
          <h4>签订合同&nbsp;&nbsp;<span> 样品确认后，我们会根据你的数量，交货期等要求制订条约并签字。</span></h4>
          <h4>支付定金&nbsp;&nbsp;<span> 签定合同后，客户支付产品全款的30%定金（定金要到账）</span></h4>
          <h4>原料采购&nbsp;&nbsp;<span> 收到定金后，采购部会根据订单数量采购原料</span></h4>
          <h4>大货生产&nbsp;&nbsp;<span>原料到位后，工厂相关负责人就分配任务进行大货生产并在交货期前完成订单。</span></h4>
          <h4>验收支付余额&nbsp;&nbsp; <span>大货生产完后，客户过来验收并支付全款的70%余款。</span></h4>
          <h4>物流发货&nbsp;&nbsp; <span> 大货一般发常规物流，有专线的可以发专线。</span></h4>
          <h4>确认收货&nbsp;&nbsp;<span>确认订单数量品质。</span></h4>
          <h4>售后服务&nbsp;&nbsp;<span>如发现有任何疑问，我们有24小时客服为您提供服务。</span></h4>
          <h4>交易完毕&nbsp;&nbsp;<span>交易满意请记找我们返单或转介绍，感谢您的支持！</span></h4>
        </div>
      </div>
      <!-- 右侧主体 -->
      <div class="detailsright">
        <div class="detright">
          <div class="icon1">
            <img src="../assets/img/details/icon1.png" alt="">
          </div>
          <div class="detrightfont">
            <h3>产品中心</h3>
            <h4>PRODUCT CENTER</h4>
          </div>
        </div>
        <div class="deteightlist">
          <ul>
            <h3><a href="javascript:;">宠物服饰</a></h3>
            <li><a href="javascript:;">秋冬装</a></li>
            <li><a href="javascript:;">春夏装</a></li>
            <li><a href="javascript:;">主题装</a></li>
          </ul>
          <ul>
              <h3><a href="javascript:;">宠物牵引</a></h3>
              <li><a href="javascript:;">牵引绳</a></li>
              <li><a href="javascript:;">项圈</a></li>
              <li><a href="javascript:;">胸背带</a></li>
          </ul>
          <ul>
              <h3><a href="javascript:;">宠物床具</a></h3>
              
          </ul>
          <ul>
              <h3><a href="javascript:;">宠物配件</a></h3>
          </ul>
          <ul>
              <h3><a href="javascript:;">旅行包</a></h3>
          </ul>       
        </div>
        <div class="detright">
            <div class="icon1">
              <img src="../assets/img/details/icon1.png" alt="">
            </div>
            <div class="detrightfont">
              <h3>公司概括</h3>
              <h4>PRODUCT CENTER</h4>
            </div>
        </div>
        <div class="deteightlist">
            <ul>
              <li><router-link :to="{path:'/aboutus'}">合作伙伴</router-link></li>
              <li><router-link :to="{path:'/aboutus'}">企业实力</router-link></li>
              <li><router-link :to="{path:'/aboutus'}">新闻资讯</router-link></li>
              <li><router-link :to="{path:'/aboutus'}">关于我们</router-link></li>
              <li><router-link :to="{path:'/aboutus'}">联系我们</router-link></li>
            </ul>
        </div>
        <div class="detrightbot">
          <div class="phoneimg">
            <img src="../assets/img/details/phone.png" alt="">
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
        <div class="detrightbottom">
          <h3>推荐产品</h3>
          <div class="detdd" v-for="(item,i) of recompro" :key="i">
            <div class="pic">
              <router-link :to="`/details/${item.pid}`">
                <img :src="`http://127.0.0.1:5050/${item.md}`" alt="">
              </router-link>
            </div>
            <p>
              <router-link :to="`/details/${item.pid}`" v-text="item.title">                            
              </router-link >
            </p>
          </div>
        </div>
        <div class="detrightbottom">
          <h3>联系我们</h3>
          <div class="btmp">
          <p>公司名称：***************</p>
          <p>公司地址：****************</p>
          <p>联系电话：6666666666</p>
          <p style="margin-left:89px;">888888888888</p>
          <p>传       真：123456789321</p>
          
          <a href="">立即资讯</a>
          <a href="">在线留言</a>
          </div>
        </div> 
      </div>
      <!-- <div class="slide">
          <ul class="rightul" @mouseleave="hide">
            <li class="fudongup"></li>
            <li class="fudongqq" @mouseover="show"></li>
            <li class="fudongphone"></li>
            <li class="fudongwx"></li>
            <li class="fudongdown"></li>
          </ul>
          <ul class="slide-info" :style="{width:wid}" @mouseleave="hide" @mousemove="show">
            <li style="display:block">
              <p>
                在线沟通请点我
                <a href="">
                  在线咨询
                </a>
              </p>
            </li>
            <li style="display:none"></li>
            <li style="display:none"></li>
          </ul>
      </div> -->
    </main>
    <my-footer></my-footer>
  </div>
</template>
<script>
export default {
    data(){
      return {
        details:{price:0},//商品详情
        others:[],//同类商品
        recompro:[],//推荐商品
        count:1,//购买数量
        ulleft:-200,
        t:null,
        wid:"0px",
        vilibi:false,
        maskstyle:{
          left:0,
          top:0
        }
      }
    },
    props:["pid"],//获取其他组件传参
    methods:{
      toggle(){
        this.vilibi=!this.vilibi;
      },
      drag(e){
        var left=e.offsetX-75;
        var top=e.offsetY-70;
        if(left<0){
          left=0
        }else if(left>190){
          left=190
        }
        if(top<0){
          top=0
        }else if(top>133){
          top=133
        }
        left=left+"px";
        top=top+"px";
        this.maskstyle={left,top};
      },
      load(){//页面加载获取商品详情
        var url="products/details";
        var obj={params:{pid:this.$route.params.pid}};
        this.axios.get(url,obj).then(res=>{
          this.details=res.data.data;
          this.others=res.data.others;
          this.recompro=this.others.slice(0,3);
          console.log(this.details)
        })
      },
      add(i,e){//加减欲购买商品数量
        var btn=e.target;
        var input=btn.parentNode.children[1];
        var n=parseInt(input.value);
        if(n>=1){
          n+=i;
        }else{
          n=1;
        }
        input.value=n;
        this.count=n;
      },
      buy(){//购买

      },
      addcart(){//添加到购物车
        var pid=this.details.pid;
        var price=this.details.price;
        var title=this.details.title;
        var subtitle=this.details.subtitle
        var count=this.count;
        var pic=this.details.sm;
        var url="products/addcart";
        var obj={params:{pid,price,title,subtitle,count,pic}};
        this.axios.get(url,obj).then(res=>{
          if(res.data.code==-1){
            this.$messagebox("消息","请登录").then(res=>{
              location.href="http://127.0.0.1:8080/index.html#/login"
            });
            return;
          }else if(res.data.code==-2){
            this.$messagebox("消息","添加失败");
            return;
          }else{
            this.$toast("添加成功");
          }
        })
      },
      gotocart(){//前往购物车
        location.href="http://127.0.0.1:8080/index.html#/carts"
      },
      show(){
        this.wid="147px"
      },
      hide(){
        this.wid="0px"
      },
      change(e){
        if(e.target.nodeName=="IMG"){
          var e=e.target.src.slice(41);
          var md=this.details.md.slice(0,19);
          var show=md+e;
          this.details.md=show;
          var lgimg=this.details.lg.slice(0,19);
          var lg=lgimg+e;
          this.details.lg=lg;
        }
      },
      scroll(){   
       this.t=setInterval(()=>{
          var ul=document.getElementById("scroll");
          
          this.ulleft-=1;
          if(this.ulleft<-1300){
            this.ulleft=-200;
          }
          ul.style.left=this.ulleft+"px";
        },25)
      },
      stop(){
        clearInterval(this.t);
      },
      move(){
        this.t=setInterval(()=>{
          var ul=document.getElementById("scroll");
          this.ulleft-=1;
          if(!ul){
            clearInterval(this.t);
          }else if(this.ulleft<-1200){
            this.ulleft=-150;
          }
          ul.style.left=this.ulleft+"px";
        },25)
      }
    },
    computed:{
      lgposition(){
        return `${-parseInt(this.maskstyle.left)*2}px ${-parseInt(this.maskstyle.top)*2}px`
      }
    },
    created(){
      this.load();
      this.scroll();
    },
    watch:{
      $route(){
        this.load();
      }
    }
}
</script>
<style  scoped>
*{
  padding: 0;
  margin:0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
}
a,button{
  cursor:pointer
}
a{
  color:#000;
  text-decoration: none;
}
.page{
  width:1200px;
  margin:auto;
  overflow: hidden;
}
.detailsleft{
  width: 890px;
  float: left;
}
.detleft-top{
  border-bottom:1px solid #c2c2c2;
  padding-bottom: 15px;
  padding-top:15px;
  overflow: hidden;
  display: flex;

}
.detleft-top a{
  font-size:16px;
  color:#292929;
  margin:0 15px;
}
.detimg{
  margin-top:30px;
  height:25rem;
  overflow: hidden;
  position: relative;
}
.img-left{
  width:340px;
  float:left;
  overflow: hidden;
}
.md-img{
  width:340px;
  height:272px;
  position: relative;
}
.md-img img{
 width:340px;
 height:272px;
}
.clearboth{
  clear: both;
}
.small-img{
  height: 60px;
  width: 340px;
  float:left;
  margin-top:15px;
  overflow: hidden;
}
.small-img ul{
    width:2000px;
    overflow: hidden;
}
.small-img img{
  width: 50px;
  height:50px;
}
.small-img ul li{
  float: left;
  margin:0px 4px;
  padding: 0 5px;
}
.small-img ul li:hover{
  border:1px solid #fab7da;
}
.img-right{
  float: left;
  width: 535px;
  margin-left: 15px;
}
.imgrightdet{
  margin-left: 10px;
}
.imgrightdet ul li{
  padding:5px;
  margin-left:25px;
  line-height: 36px;
}
.imgrightdet span{
  display: inline-block;
  width:390px;
  height:2rem;
  border-bottom:1px solid #dfdfdf;
}

.more-click-button{
  width: 8rem;
  height:50px;
  background: #fab7da;
  text-align: center;
  margin-left: 10px;
  margin-top:22px;
  color:#fff;
  line-height: 50px;
  font-size:16px;
  box-sizing: border-box;
  border:1px solid #ccc;
}
.products{
  display:flex;
  flex-direction: column;
  text-align:left !important;
}
.buycount{
  margin-left:2.5rem;
  margin-top:0.5rem
}
.buycount button{
  border: 1px solid #ccc;
  padding:5px 10px;
  cursor: pointer;
  background: rgb(245, 245, 245);
}
.buycount input{
  width:3rem;
  text-align: center;
  padding:5px 10px;
  /* border-top:1px solid #ccc; */
  /* border-bottom:1px solid #ccc; */
  box-sizing: border-box;
  padding-top:3px;
}
.detailsright{
  width:280px;
  margin-left:30px;
  position: relative;
  float: left;
}
.detright{
  background: url("../assets/img/details/probt.png")no-repeat;
  width:280px;
  text-align: center;
  height: 106px;
  padding:25px 0 0 0;
  z-index: 12;
  position: relative; 
}
.icon1{
  vertical-align: top;
  display: inline-block;
  padding-top:10px;
  
}
.detrightfont{
  display: inline-block;
  margin-left:9px;
}
.detrightfont h3{
  color:#fff;
  font-size:36px;
  line-height: 40px;
  font-weight: normal;
}
.detrightfont h4{
  color:#fff;
  font-size:16px;
  font-family: arial;
  position: relative;
}
.deteightlist{
  border:1px solid rgb(220,220,220);
  padding:20px 20px 0;
  background: #f3f3f3;
}
.deteightlist h3{
  background: url("../assets/img/details/gutou.png")no-repeat;
  width:227px;
  height:71px;
  line-height: 71px;
  padding-left: 60px;
  margin-bottom:5px;
}
.deteightlist h3 a:before{
  content:url("../assets/img/details/icon2.png");
  width:21px;
  height: 18px;
  margin:4px 6px 0 0;
  display: inline-block;
  vertical-align: top;
}
.deteightlist h3 a{
  color:#333;
  font-size:18px;
  font-weight: normal;
}
.deteightlist ul li a::before{
  content: url("../assets/img/details/icon3.png");
  width:6px;
  height: 6px;
  display: inline-block;
  vertical-align: top;
  margin:-3px 12px 0 0;
}
.deteightlist ul li{
  padding:0 0 7px 70px;
}
.deteightlist ul li a{
  color:#333;
  font-size:16px;
}
.detrightbot{
  background: url("../assets/img/details/probt.png")no-repeat;
  height:100px;width:280px;
  padding:20px 0 0 30px;
  text-align: center;
}
.detrightbot img{
  vertical-align: top;
  margin-right: 6px;
  margin-top:6px;
}
.phoneimg{
  width:66px;
  height:66px;
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
  font-size:14px;
  color:#ffe9cf;
  line-height: 20px;
}
.detrightbot .phonebt span{
  font-size:22px;
  color:#fff;
  font-family: Impact;
  display: inline-block;
  line-height: 22px;
}
.detrightbottom{
  border:1px solid #d8d8d8;
  margin:20px 0 0;
}
.detrightbottom h3{
  text-align: center;
  color:#fff;
  font-size:20px;
  height:40px;
  line-height:40px;
  width:100%;
  background: #fab7da;
}
.detrightbottom img{
  width: 238px;
  height: 191px;
  border:1px solid #ccc;
}
.detdd{
  text-align: center;
  margin:10px 0;
}
.detrightbottom a{
  font-size:14px;
  color:#494949;
}
.btmp p{
  color:#494949;
  font-size:16px;
  margin:10px 0 10px 10px;
}
.btmp a{
  color:#fff;
  font-size: 16px;
  background: #fab7da;
  display: inline-block;
  line-height: 30px;
  margin: 5px 15px 5px 22px;
  text-align: center;width:98px;
  height:30px;
}
.detailstop h3{
  font-size:18px;
  background: #fab7da;
  width:140px;
  height:40px;
  line-height: 40px;
  text-align: center;
  padding: 0 5px;
  margin:0 0 0 10px;
  color:#fff;
}
.detailstop{
  border-bottom:4px solid #fab7da;
  margin-top:2rem
}
.detailsbody{
  margin:30px 0 20px;
  font-size:14px;
}
.detailsbody p{
  padding:0 0 0 60px;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  line-height: 1.5;
  font-size: 14px;
  margin:3px 0;
}
.detailsbody p span{
  color:rgb(153,153,153);
}
.liucheng{
  display:flex;
  flex-direction: column;
  justify-content:space-between
}
.liucheng h4{
  font-size:20px;
  margin:4px 0;
}
.liucheng span{
  font-size: 15px;
  font-weight: normal;
}
.xiangguan{
  font-size:18px;
  padding-bottom:3px;
  border-bottom:2px solid #fab7da;
}
.chanpinxg{
  margin-top:30px;
  overflow: hidden;
}
.btmscoll ul{
  width:2880px;
  position: relative;
  overflow: hidden;
  margin-top:25px;
 
}
.btmscoll ul li{
  float: left;
  height: 200px;
  width:200px;
  margin:0 22px 22px 0;
  text-align: center;
}
.btmscoll ul li img{
  width:200px;
  height: 175px;
}
.slide{
    position: fixed;
    top:30%;
    width:50px;
    height:250px;
    background: #fab7da;
    right:0;
    border-radius: 5px 0 0 5px;
    z-index: 999;
}
.rightul li{
    width:49px;
    height:50px;
    background: url("../assets/img/details/righticon.png")no-repeat;
}
.rightul li.fudongup{
    background-position: -330px -120px;
}
.rightul li.fudongqq{
    background-position: -385px -73px;
}
.rightul li.fudongphone{
    background-position: -385px -160px;
}
.rightul li.fudongwx{
    background-position: -385px -120px;
}
.rightul li.fudongdown{
    background-position: -330px -160px;
}
.slide-info{
  background: #fab7da;
  width:0px;
  height: 147px;
  overflow: hidden;
  transition: 0.5s;
  border-radius: 4px 0 0 4px;
  position: absolute;
  top:50%;
  right:100%;
  margin-top:-73px;
}
.slide-info li{
  width:145px;
  color:#cccccc;
  text-align: center
}
.slide-info p{
  color:#fff;
  padding:14px;
  text-align: left;
  position: relative;
  font:normal 18px "宋体" !important;
  margin-top: 16px;
}
.slide-info a{
  display: block;
  margin-top:12px;
  width:100px;
  height: 32px;
  line-height: 32px;
  color:#fff;
  font-size:16px;
  text-align: center;
  text-decoration: none;
  border: 1px solid #fff;
  border-radius: 5px;
}
.zhezhaocheng{
  position: absolute;
  background: #fab7da;
  opacity: 0.5;
  width:150px;
  height:140px;
  top:0;
  left:0;
}
#lg-img{
  width:350px;
  height:280px;
  position: absolute;
  left:340px;
  top:0;
  border:1px solid #000;
  z-index: 1000;
  background-repeat: no-repeat;
  background-size:220%;
}
#super-mask{
  width:340px;
  height:272px;
  opacity: 0;
  position: absolute;
  left: 0;
  top:0;
}

</style>