<template>
    <div>
        <my-header></my-header>
        <main class="container-fluid">
            <!-- 页头大图 -->
            <div>
                <img src="../assets/img/others/aboutus.jpg" alt="" class="w-100">
            </div>
            <!-- 页头英文 -->
            <div class="model1">
                ABOUT OUR BRIEF RNTIOTUCTING
            </div>
            <!-- 页头汉字 -->
            <div class="title1">
                <div class="red_line"></div>
                        关于我们
                <div class="red_line"></div>
            </div>
            <!-- 页面主体 -->
            <div class="my-main">
                <!-- 左侧图片区 -->
                <div class="my_img">
                    <img src="../assets/img/others/aboutus1.jpg" alt="">
                </div>
                <!-- 右侧文字区 -->
                <div class="righttxt">
                    <h2>HOME OF CUTE PET</h2>
                    <h3>萌宠之家</h3>
                    <div class="model_line">
                        <div class="red_line"></div>
                    </div>
                    <div>
                        萌宠之家是一个定位于推动国内爱宠人士的交易和交流平台，在当今快节奏时代下，为独身在都市打拼的人们提供一份心灵的慰藉和便利。凭借多年的经验，我公司致力于猫咪，提供专业服务，协同时代节拍，力求尽善尽美。
					  
                    <br><br>
                          当您某段时间事务繁忙，不便照顾爱宠，我们可以提供宠物寄养服务，实时沟通爱宠状况，提供全方位最专业的宠物饲养。
                    <br><br>
                          当您即将离开这座城市，去往远方，您可以通过我们平台为您的爱宠选择一位您心目中的新主人，双向选择，互相放心。
                    <br><br>
                          当您的爱宠产下幼崽，照顾不来，可以在我们平台寄售，无需手续费，同城交易，安全放心。"
                     <br><br>
                          当您孤身来到这座城市，倍感孤独时，可以通过我们平台选择一只可以长期陪伴您的爱宠，送宠到家，并随时提供专业指导。
                     <br><br>
                     品质、品位、品牌，一切从满意开始，优良的产品质量，优惠的销售价格，诚信而专业的售前、售中、售后服务是我们对您的承诺。
                    </div>
                </div>
            </div>
            <!-- 页面底部 -->
            <div class="d-flex justify-content-around my_bottom">
                <div class="d-flex flex-column">
                    <div>
                        <img src="../assets/img/others/bottom1.jpg" alt="">
                    </div>
                    <span>100%纯种</span>
                </div>
                <div class="d-flex flex-column">
                    <div>
                        <img src="../assets/img/others/bottom2.jpg" alt="">
                    </div>
                    <span>30天质保</span>
                </div>
                <div class="d-flex flex-column">
                    <div> 
                        <img src="../assets/img/others/bottom3.jpg" alt="">
                    </div>
                    <span>养宠顾问</span>
                </div>
                <div class="d-flex flex-column">
                    <div>
                        <img src="../assets/img/others/bottom4.jpg" alt="">  
                    </div>
                    <span>终身售后</span>
                </div>
            </div>
            <!-- 底部图片 -->
            <div class="mt-5">
                <img src="../assets/img/others/aboutus2.png" alt="">
            </div>
            <!-- 联系我们     -->
            <div class="collection">
                <h3>精英团队期待为您服务，成为我们的客户吧</h3>
                <router-link :to="{path:'/article'}" class=" btn btn-light callus" >联系我们</router-link>
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
main{
    font-family: MicrosoftYaHei;
    font-stretch: normal;
    padding: 0;
    margin: 0;
    list-style: none;
    text-align: center
}
.model1{
    color:#a0a0a0;
    text-align:center;
    margin-top:6rem;
    font-size:36px;
}
.model_line{
    margin:1rem 0 1.5rem;
    width:32rem;
    height:1px;
    background: #e5e5e5;
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
.model_line>.red_line{
    width:11.5rem;
    height:3px;
    position:relative;
    top:-15px;
}
.title1{
    margin:4rem 0 7rem;
    color:#ff6542;
    height:30px;
    font-size:24px;
} 
.my-main{
    display:flex;
    text-align:center
}
.my_img{
    vertical-align: top;
    width:30%;height:533px;
    border:4px solid #ff6542;
    margin-left:5rem;
    position:relative
}
.my_img>img{
    width:100%;height:480px;
    position:absolute;
    top:29px;
    left:24px;
}
.righttxt{
    width:60rem;
    padding-left:5rem;
}
.righttxt>h2{
    margin-top:3rem;
    font-size:2rem;
    color:#ff6542
}
.righttxt>h3{
    font-size:24px;
    color:#ff6542
}
.my_bottom{
    margin-top:2rem;
    color:#ff6542
}
.my_bottom>div>div{
    width:6rem;height:6rem;
    background: #fff;
    border:1px solid #ff6542;
    border-radius:50%;
    position:relative;
    margin-bottom:1rem;
}
.my_bottom>div>div>img{
    position:absolute;
    top:18px;left:22px;
}
.collection{
    width:100%;height:15rem;
    background: #ff6542;
    text-align: center;
}
.collection>h3{
    color:#e5e5e5;
    text-align:center;
    padding:3rem 0  0 0;
}
.collection>.callus{
    width:11rem;height:3rem;
    background: #e5e5e5;
    margin-top:3rem;
    line-height: 2rem;
}
</style>