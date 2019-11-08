<template>
    <div>
        <main class="bg">
            <div class="zhezhao"></div>
            <my-header></my-header>
            <div>
                <img src="../assets/img/others/1.jpg" alt="" class="w-100">
            </div>
            <section class="my_know container">
                <div class="title1">
                    <p>铲屎官的日常须知</p>
                    <div>
                        <span>——</span>
                        THE CAT knowledge
                        <span>——</span>
                    </div>
                </div>
                <!-- 宠物饲养常识 -->
                <div class="f1" v-for="(item,index) of lists" :key="index">
                    <div class="f1-img">
                            <img :src="`http://127.0.0.1:5050/${item.pic}`" alt="">
                    </div>
                    <div class="wz1">
                            <div class="title1"><a href="javascript:;" class="titlea" v-text="item.title"></a></div>
                            <div class="title2">
                                <span v-text="item.showday.slice(0,10)"></span>
                                <span class="slt">浏览量：{{item.nums}}</span>
                            </div>
                            <div class="div-text" @click="knowmore">
                                &nbsp;&nbsp;&nbsp;&nbsp;{{item.details}}
                            </div>
                    </div>
                </div>
                <!-- 分页 -->
                <ul class="pagination mb-0 justify-content-end">
                    <li class="page-item" :class="{disabled:pno==0}">
                        <a href="javascript:;" class="page-link bg-transparent" @click="change(-1,$event)">上一页</a>
                    </li>
                    <li class="page-item" v-for="i of pageCount" :key="i" :class="{active:i-1==pno}">
                        <a href="javascript:;" v-text="i" class="page-link" :class="i-1==pno?'border':'bg-transparent'" @click="changepage(i-1)"></a>
                    </li>
                    <li class="page-item" :class="{disabled:pno==pageCount-1}">
                        <a href="javascript:;" class="page-link bg-transparent" @click="change(+1,$event)">下一页</a>
                    </li>
                </ul>
            </section>
        </main>
        <my-footer></my-footer>
    </div>
</template>
<script>
export default {
    data(){
        return {
            lists:[],//知识列表
            pno:0,
            pcount:0,
            pageCount:0
        }
    },
    methods:{
        //页面加载，获取相关数据
        load(pno=0){
            var url="products/knowledge";
            var obj={params:{pno}}
            this.axios.get(url,obj).then(res=>{
                this.lists=res.data.data;
                this.pno=res.data.pno;
                this.pageCount=res.data.pageCount;
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
        knowmore(){
            this.$router.push("news")
        }
    },
    created(){
        this.load();
    }
}
</script>
<style  scoped>
    main{
        font-family: MicrosoftYaHei;
        font-stretch: normal;
        padding: 0;
        margin: 0;
        list-style: none;
        text-align: center
    }
    .bg{
        height:3000px;
        background: url("../assets/img/others/news.jpg") no-repeat center center;
        background-size:cover;
        display:flex;
        opacity:0.8;
        flex-direction: column;
        filter:blur(90rpx);/*高斯模糊滤镜*/
    }
    .title1{
        margin-top:1rem;
        margin-bottom:0.5rem;
    }
    .my_know{
        display:flex;
        flex-direction: column;
        justify-content: center
    }
  .slt{
      margin-left: 25px;
  }
  .f1-img>img{
    width:300px;
    height: 200px;
  }
  .f1{
      display: flex;
      justify-content:space-around;
      margin-top: 20px;
      width: 860px;
      cursor:pointer;
      margin-bottom: 5px;
      border-bottom: 3px solid transparent;
  }
  .f1:hover{
      border-bottom:3px solid orangered;
  }
  .f1-img{
      display: inline-block;
  }
 .wz1{
     margin-left: 5px;
 }
 .div-text{
    text-align: left;
    width: 530px;
    font-size: 12px;
    line-height: 20px;
    color:black;
 }
 .title1,.title2{
     margin-left: -180px;
 }
 .titlea{
     text-decoration:none;
     color:black;
     font-size: 20px;
 }
 .titlea:hover{
     color:chocolate;
 }
</style>