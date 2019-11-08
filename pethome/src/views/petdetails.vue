<template>
    <div class="bgcolor">
        <my-header></my-header>
        <header>
            <img src="../assets/img/others/aboutus.jpg" alt="">
        </header>
        <main id="main" class="container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb bg-transparent">
                <li class="breadcrumb-item"><a class="text-dark font-weight-bold " href="javascript:;">首页</a></li>
                <li class="breadcrumb-item"><a class="text-dark font-weight-bold" href="javascript:;">精选萌宠</a></li>
                <li class="breadcrumb-item text-dark font-weight-bold  active" aria-current="page">{{pet.title}}</li>
                </ol>
            </nav>
            <div class="container mb-5">
                <div class="row pr-3">
                    <div id="preview" class="col pr-0">
                        <div class="card bg-transparent mr-5 position-absolute">
                        <img class="card-img-top" :src="`http://127.0.0.1:5050/${pet.md}`" alt="Card image cap" id="mImg">
                        <div id="mask" class="position-absolute" v-show="show" :style="maskStyle"></div>
                        <div id="super-mask" @mouseover="toggle" @mouseout="toggle" @mousemove="drag" class="position-absolute"></div>
                        <div id="div-lg" class="position-absolute" v-show="show" :style="{'background-image':`url('http://127.0.0.1:5050/${pet.lg}')`,'background-position':bgPosition}"></div>
                        <div class="card-body p-0 text-center">
                            <img src="../assets/img/details/hover-prev.png" class="btn float-left btn-light border-0 p-1 pt-4 pb-4" id="btnLeft" @click="move(-1)" :class="times==0?'disabled':''">
                            <div class="d-inline-block pt-2 mx-0 m-auto">
                            <ul class="list-unstyled mb-0" id="ulImgs" :style="{width:pics.length*62+'px', 'margin-left':-62*times+'px'}" @mouseover="changei">
                                <li class="float-left p-1" v-for="(p,i) of pics" :key="i">
                                <img :src="`http://127.0.0.1:5050/${p.sm}`" :data-i="i">
                                </li>
                            </ul>
                            </div>
                            <img src="../assets/img/details/hover-next.png" class="btn float-right btn-light border-0 p-1 pt-4 pb-4"  id="btnRight" @click="move(+1)" :class="times>=pics.length-4?'disabled':''">
                        </div>
                        </div>
                    </div>
                    <div id="details" class="col pl-0">
                        <h4 id="ptitle" class="font-weight-bold " v-text="pet.title"></h4>
                        <h5>
                            <a class="small text-dark font-weight-bold" href="javascript:;"  id="p_sub_title" v-text="pet.subtitle"></a>
                        </h5>
                        <div class="alert alert-secondary " role="alert">
                            <div>
                                <span>友情价：</span>
                                <h2 class="d-inline text-primary font-weight-bold" >¥{{pet.price.toFixed(2)}}</h2>
                            </div>
                            <div>
                                <span>原主寄语：</span>
                                <span  v-text="pet.says" class="text-info my_says"></span>
                            </div>
                            </div>
                            <!-- 规格 -->
                            <div>
                                <div class="float-left ">同种萌宠：</div>
                                <div class="float-left w-75" id="specs">
                                    <router-link v-for="(p,i) of pics" :key="i" class="btn mx-3  my-1 btn-outline-secondary" :class="p.aid==aid?'active':''" :to="`/petdetails/${p.aid}`" v-text="p.title"></router-link>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <!-- 数量 -->
                            <div class="mt-2">
                                <div class="float-left ">数量：</div>
                                <div class="input-group mb-3 w-25">
                                    <h5>1</h5>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <!-- 萌宠年龄 -->
                            <div class="mt-2">
                                <div class="float-left">萌宠年龄：</div>
                                <div class="input-group mb-3 w-25">
                                    <h5>{{pet.age}}天</h5>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <!-- 寄售日期 -->
                            <div class="mt-2">
                                <div class="float-left ">寄售日期 ：</div>
                                <div class="input-group mb-3 w-25 ml-5">
                                    <h5 >{{pet.saletime.slice(0,10)}}</h5>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <!-- 联系人 -->
                            <div class="mt-2 small">
                                <div class="float-left small">联系人：</div>
                                <div class="input-group mb-3 w-25 text-muted ml-5 small">
                                    <h6 >{{pet.oldmaster}}</h6>
                                </div>
                                <div class="float-left small">联系方式：</div>
                                <div class="input-group mb-3 w-25 text-muted ml-5 small">
                                    <h6>{{pet.phone}}</h6>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <!-- 购买部分 -->
                            <div class="d-flex justify-content-around">
                                <a class="btn pt-3 pb-2 btn-primary px-4" href="javascript:;" @click="pay">
                                    立即购买
                                </a>
                                <router-link class="btn btn-primary pt-3 pb-3 px-4" :to="{path:'/cutepets'}">
                                    再去逛逛
                                </router-link> 
                            </div>
                            <div class="my_pay">
                                <img src="../assets/img/footer/gmy.jpg" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <h4 class="d-inline-block ml-3">为您推荐</h4>
                <h6 class="d-inline-block bg-dark text-white ml-2">精选萌宠</h6>
                <div class="btmscoll" style="margin:0 15px;overflow:hidden">
                    <ul @mouseover="stop" @mouseout="move"   id="scroll" style="position: relative;left:-200px;list-style:none" >
                    <li v-for="(item,i) of pics" :key="i">
                        <router-link :to="`/petdetails/${item.aid}`"><img :src="`http://127.0.0.1:5050/${item.md}`" alt=""></router-link >
                        <div>
                        <span v-text="item.title"></span>
                        </div>
                    </li>
                    </ul>
            </div>  
        </main>
        <my-footer></my-footer>
    </div>
</template>
<script>
export default {
    data(){
        return {
            pet:{price:0,saletime:''},
            pics:[
                {aid:0,sm:"",md:"",lg:"",title:""}
            ],
            times:0,
            i:0,
            t:null,
            wid:"0px",
            show:false,
            ulleft:-200,
            maskStyle:{left:0,top:0}
        }
    },
    props:["aid"],
    methods:{
        load(){
            var url="products/petdetails";
            var obj={params:{aid:this.$route.params.aid}};
            this.axios.get(url,obj).then(res=>{
                this.pet=res.data.data.pet;
                this.pics=res.data.data.pics;
            })
        },
        move(i){
            if(this.pics.length>4){
                this.times+=i;
                if(this.times<0){
                    this.times=0;
                }else if(this.times>this.pics.length-4){
                    this.times=this.pics.length-4;
                }
            }
        },
        changei(e){
            if(e.target.nodeName=="IMG"){
                this.i=e.target.dataset.i
            }
        },
        pay(e){
            var btn=e.target;
            btn.parentNode.nextElementSibling.style.display="inline-block"
        },
        drag(e){
            var left=e.offsetX-88;
            var top=e.offsetY-88;
            if(left<0){left=0}
            else if(left>176){left=176};
            if(top<0){top=0}
            else if(top>176){top=176};
            left=left+'px';
            top=top+'px';
            this.maskStyle={left,top}
        },
        toggle(){this.show=!this.show},
        scroll(){   
            this.t=setInterval(()=>{
                var ul=document.getElementById("scroll");
                this.ulleft-=10;
                if(this.ulleft<-1000){
                    this.ulleft=-200;
                }
                ul.style.left=this.ulleft+"px";
            },200)
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
    created(){
      this.load();
      this.scroll();
    },
    computed:{
        bgPosition(){
            return `${-parseInt(this.maskStyle.left)*16/7}px ${-parseInt(this.maskStyle.top)*16/7}px`
        }
    },
    watch:{
        $route(){//lid(){
            this.times=0;
            this.i=0;
            this.maskStyle={left:0,top:0};
            this.show=false;
            this.load();
        }
    }
}
</script>
<style  scoped>
/* .bgcolor{
    background: #e5e5e5
} */
 .my_says{
     font-size:16px;
     padding:0.5rem 0
 }
 .my_pay{
     position:absolute;
     top:20%;
     display:none;
 }
  /*定制放大镜样式*/
  #preview>.card>.card-body>div{
    width:248px;
    overflow:hidden;
  }
  #preview>.card>.card-body>div>ul{
    transition:margin-left .5s linear;
  }
  #preview>.card>.card-body>div>ul>li{
    width:62px; height:62px;
  }
  #preview>.card>.card-body>div>ul img{
    width:52px; height:52px;
  }
  #preview>.card>.card-body>div>ul img:hover{
    border:1px solid #e4393c;
  }
  #preview>div>img{width:354px}
  #mask{
    width:176px; height:176px;
    background-color:#ffa;
    opacity:.5;
  }
  #super-mask{
    width:352px; height:352px;
  }
  #div-lg{
    width:400px; height:400px;
    left:354px;
    z-index:1000;
    border: 1px solid rgba(0, 0, 0, 0.125)
  }
  /*定制为你推荐部分的样式*/
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
  /*订制商品详情部分的样式*/
  #main>nav.navbar{
    background:linear-gradient(to bottom,#f0f0f0,#e0e0e0);
    box-shadow:0px 3px 6px #ccc
  }
  #main>nav.navbar .active{
    margin-top:2px;
    border-bottom:3px solid #0069d9;
  }
  #params .col-md-2>.btn{
    background: linear-gradient(to bottom,#f0f0f0,#e0e0e0);
    box-shadow:0px 3px 4px #ccc
  }
  #params .col-md-10>div>ul>li{
    width: 237px;
  }
</style>