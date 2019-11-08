<template>
    <div>
        <!-- 联系我们 -->
        <my-header></my-header>
        <!-- 顶部图片 -->
        <div id="contactheader">
            <div class="img">
                <img src="../assets/img/others/lianxi.png" alt="" > 
                <div>
                    <div class="img-txt1">我们的故事从联系开始</div>
                    <div class="img-txt2">
                        孤独的城市，奋斗的你我，藉着一份对猫咪的喜爱，对孤独的厌弃相聚在这里。 <br><br>
                        缘，妙不可言，希望在这里能认识更多的朋友，找到一只能陪你在这个城市坚持下去的小可爱。<br><br>
                        您可以通过电话，微信，邮件联系我们，我们将不定期举办线下活动，组织更多的猫咪爱好者聚会交流，随时准备为您服务。
                    </div>
                </div>
            </div>
        </div>
        <!-- 页面主体 -->
        <main >
            <!-- 页头英文 -->
            <div class="model1">
                CONTACT US
            </div>
            <!-- 页头汉字 -->
            <div class="title1">
                <div class="red_line"></div>
                        联系我们
                <div class="red_line"></div>
            </div>
            <!-- 部分链接 -->
            <div class="d-flex flex-column justify-content-center " id="msg">
                <router-link :to="{path:'/aboutpet'}">猫咪训练容易么？怎么才能练出一只好猫咪？</router-link>
                <router-link :to="{path:'/aboutus'}">了解更多关于萌宠之家...</router-link>
                <router-link :to="{path:'/salecat'}">点击查看，免费发布寄售信息...</router-link>
                <router-link :to="{path:'/aboutpet'}">萌宠之家——认识更多爱喵之友——点击查看</router-link>
            </div>
            <!-- 联系方式 -->
            <div class="d-flex justify-content-around text-center mt-4">
                <div class="lianxi">
                    <img src="../assets/img/others/lianxi_location.png" alt="">
                    <p>公司地址</p>
                    <p>河南省郑州市金水区硅谷大厦24楼郑州科创中心</p>
                </div>
                <div class="lianxi">
                    <img src="../assets/img/others/lianxi_tel.png" alt="">
                    <p>联系电话</p>
                    <p>13501894068</p>
                </div>
                <div class="lianxi">
                    <img src="../assets/img/others/lianxi_email.png" alt="">
                    <p>邮件联系</p>
                    <p>254600767@qq.com</p>
                </div>
            </div>
            <!-- 地图定位 -->
            <div class="text-center">
                <img src="../assets/img/others/map.png" alt="" class="w-75 ">
            </div>
            <div class="container">
                <!-- 页面底部 -->
                <!-- 页脚英文 -->
                <div class="model2">
                    LOOKING FORWARD TO EACH OF OUR ENCOUNTERS
                </div>
                <!-- 页脚汉字 -->
                <div class="title2">
                    <div class="red_line"></div>
                            期待我们的每一次相遇
                    <div class="red_line"></div>
                </div>
                <img src="../assets/img/others/lianxi2.png" alt="" class="w-100">
            </div>
        </main>
        <my-footer></my-footer>
    </div>
</template>
<script>
export default {
}
</script>
<style  scoped>
    #contactheader{
        position:relative;
        /* text-align: center; */
    }
    #contactheader>.img{
        position: absolute;
        top:0;left:0
    }
    #contactheader>.img>div{
        width: 100%;
        position:absolute;
        top:0;left:0;
    }
    #contactheader>.img>div>.img-txt1, #contactheader>.img>div>.img-txt2{
        font-size:24px;
        /* text-align: center;  */
        padding-left:5rem;
        margin:2rem 0;
        color:#fff
    }
    #contactheader>.img>div>.img-txt2{
        font-size:16px;
        margin:1.25rem auto;
        padding-top:0.62rem;
        font-family: MicrosoftYaHei;
    }
    .model1,.model2{
        color:#a0a0a0;
        text-align:center;
        margin-top:26rem;
        font-size:36px;
    }
    .model2{
        margin-top:3rem;
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
    .title1,.title2{
        margin:1rem auto 2rem;
        text-align: center;
        color:#ff6542;
        height:30px;
        font-size:24px;
    } 
    #msg{
        text-align: center
    }
    #msg a{
        color:#333;
        text-decoration: none;
    }
    .lianxi{
        width:16rem;height:16rem;
        box-shadow: 0px 1px 21px 0px rgba(0, 29, 57, 0.17);
        border-radius:5px;
        margin-bottom:1rem;
    }
    .lianxi img{
        margin-top:1.8rem
    }
    .lianxi p{
        margin:1rem 1rem;
        font-size:14px;
    }
</style>