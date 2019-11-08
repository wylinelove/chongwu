<template>
    <div>
        <!-- 宠物用品列表页 -->
        <my-header></my-header>
        <nav>
            <img src="../assets/img/others/aboutus3.jpg" alt="" >
        </nav>
        <main class="container-fluid" id="main">
            <!-- 页头汉字 -->
            <div class="model1">
                萌宠一览
            </div>
            <!-- 页头英文 -->
            <div class="title1">
                <div class="red_line"></div>
                        ALL PETS 
                <div class="red_line"></div>
            </div>
            <!-- 宠物列表 -->
            <section class="row mx-0">
                <div class="col-9 px-0">
                    <!-- 商品列表 -->
                    <div class="row mx-0 my_list">
                        <div class="col-4 px-0 product" v-for="(item,index) of pets" :key="index">
                            <router-link :to="`/petdetails/${item.aid}`">
                                <img :src="`http://127.0.0.1:5050/${item.md}`" alt="" class="w85">
                                <span v-text="item.title" class="title2"></span>
                                <span v-text="item.subtitle" class="title3"></span>
                                <div class="d-flex justify-content-around pb-3">    
                                    <span class="price">￥{{item.price.toFixed(2)}}</span>
                                    <a href="`/petdetails/${item.pid}`" class="btn my_btn">了解详情</a>
                                </div>
                            </router-link>
                        </div>
                    </div>
                    <!-- 分页 -->
                    <div class="my-5">
                        <ul class="pagination justify-content-end">
                            <li class="page-item" :class="{disabled:pno==0}">
                                <a href="javascript:;" class="page-link bg-transparent" @click="change(-1,$event)">上一页</a>
                            </li>
                            <li class="page-item px-1" v-for="i of pageCount" :key="i" :class="{active:i-1==pno}"> 
                                <a href="javascript:;" v-text="i" class="page-link" :class="i-1==pno?'border':'bg-transparent'" @click="changepage(i-1)"></a>
                            </li>
                            <li class="page-item" :class="{disabled:pno==pageCount-1}">
                                <a href="javascript:;" class="page-link bg-transparent" @click="change(+1,$event)">下一页</a>
                            </li>
                        </ul>
                    </div>
                </div>
                 <div class="col-3 px-0">
                    <div class="d-flex flex-column"> 
                        <!-- 可认领宠物列表 -->
                        <div class="text-center">
                            <h3 class=" my_free">可认领猫咪</h3>
                        </div>
                        <div id="scrolldiv">
                            <div id="scroll" style="position:relative;top:0px">
                                <div v-for="(item,index) of freepets" :key="index" class="freepet">
                                <router-link :to="`/petdetails/${item.aid}`">
                                    <img :src="`http://127.0.0.1:5050/${item.md}`" alt="" class="w-75">
                                    <span v-text="item.title" class="title2"></span>
                                    <span v-text="item.subtitle" class="title3"></span> 
                                    <span class="price">￥{{item.price.toFixed(2)}}</span>
                                </router-link>
                            </div>
                            <div v-for="(item,index) of freepets" :key="index" class="freepet">
                                <router-link :to="`/petdetails/${item.aid}`">
                                    <img :src="`http://127.0.0.1:5050/${item.md}`" alt="" class="w-75">
                                    <span v-text="item.title" class="title2"></span>
                                    <span v-text="item.subtitle" class="title3"></span> 
                                    <span class="price">￥{{item.price.toFixed(2)}}</span>
                                </router-link>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </section>
        </main>
        <my-footer></my-footer>
    </div>
</template>
<script>
export default {
    data(){
        return {
            t:null,
            top:0,
            pets:[
                {aid:0,price:0}
            ],
            freepets:[],
            pno:0,
            pcount:0,
            pageCount:0
        }
    },
    props:["kw"],
    methods:{
        load(pno=0){
            var url="products/petlist";
            var obj={params:{pno}};
            this.axios.get(url,obj).then(res=>{
                this.pets=res.data.data;
                this.pno=res.data.pno;
                this.pageCount=res.data.pageCount;
                for(var pet of this.pets){
                    if(pet.is_onsale==1){
                        this.freepets.push(pet)
                    }
                };
            })
        },
        //页数绑定函数
        change(n,e){
            if(e.target.className.indexOf("disabled")==-1){
                this.changepage(parseInt(this.pno)+parseInt(n))
            }
        },
        //点击跳转到第几页
        changepage(i){
            this.load(i)
        },
        scroll(){
            
           if(this.top>=0){
               clearInterval(this.t)
               this.t=setInterval(()=>{
                   var d=document.getElementById("scroll")
                   this.top-=1 
                   d.style.top=this.top+"px"
                   if(this.top<-1200)
                   {    clearInterval(this.t)
                       this.t=setInterval(() => {
                   var d=document.getElementById("scroll")
                   this.top+=1 
                   d.style.top=this.top+"px"; 
                   if(this.top>0){
                       clearInterval(this.t)
                       this.t=setInterval(()=>{
                           var d=document.getElementById("scroll")
                   this.top-=1 
                   d.style.top=this.top+"px"
                   if(this.top<-1200)
                   {    clearInterval(this.t)
                       this.t=setInterval(() => {
                   var d=document.getElementById("scroll")
                   this.top+=1
                   d.style.top=this.top+"px"

                       },25)
                   }
                       },25)
                   }
                  
               },25);
                   }
               },25)
           
           }

        }
    },
    created(){
        this.load();
        this.scroll();
    },
    watch:{
        kw(){
            this.load();
        }
    }
}
</script>
<style  scoped>
    #main{
       text-align: center 
    }
    .my_list{
        padding:0.5rem 1rem 0.5rem 10rem
    }
    .my_free{
        background:rgba(33,33,33,.2);
        padding:1rem 0;
        border-radius: 8px;
        color:#ff6542;
    }
    .model1{
        color:#a0a0a0;
        text-align:center;
        margin-top:6rem;
        font-size:24px;
    }
    .title1{
        margin:2rem 0 3rem;
        color:#ff6542;
        height:30px;
        font-size:18px;
    } 
    .red_line{
        display: inline-block;
        vertical-align: center;
        position:relative;
        top:calc(50% -0.5px);
        width:7rem;
        height:1px;
        background: #ff6542;
        margin:0 2.5rem;
    }
    .product{
        display:flex;
        flex-direction: column;
        justify-content: center;
        /* border:1px solid #ccc; */
        padding-top:0.5rem;
        border-radius: 5px
    }
    .product:hover{
        background: #ff6542;
    }
    .product span,.freepet span{
        display:block
    }
    .product .w85{
        width:95%
    }
    .product img{
        transition: all .5s linear
    }
    .product img:hover{
        transform: scale(1.05);
    }
    a{
        text-decoration: none;
    }
    .product a{
        color:#333
    }
    .product .title2,.freepet .title2{
        font-size:18px;
        font-weight:500;
        padding-top:0.3rem;
        color:#555;
    }
    .freepet .title2{
        font-size:16px;
    }
    .product .title3,.freepet .title3{
        font-size:14px;
        font-weight:300;
        padding-top:0.3rem;
        color:#444;
    }
    .product .price,.freepet .price{
        font-size:24px;
        font-size:600;
        color:#f0f;
    }
    .product .my_btn{
        transition:all .2s linear
    }
    .product .my_btn:hover{
        width:8rem;
        background: #0aa1ed
    }
     #scrolldiv{
        height: 1200px;
        overflow: hidden;
    }
</style>