<template>
    <div>
        <my-header></my-header>
        <main class="container text-center">
            <div class="left">
                <!-- 标语 -->
                <h6>请认真填写下面的资料，以防止他人冒充，谢谢!</h6>
                <!-- 卖 -->
                <!-- title VARCHAR(128), #主标题 -->
                <div>
                    <b>宠物名</b>&nbsp;&nbsp;<span>(必填)</span> <br> 
                    <input class="txtinput" v-model="pname" id="pname">  
                    <span></span>
                </div>
                <!-- family_id INT,      #宠物品种家族编号 -->
                <div>
                    <b class="breed">品种:</b> 
                        <select v-model="ptype">
                            <option value="0">波斯猫</option>
                            <option value="1">布偶猫</option>
                            <option value="2">加拿大无毛猫</option>
                            <option value="3">美国短毛猫</option>
                            <option value="4">挪威森林猫</option>
                            <option value="5">暹罗猫</option>
                            <option value="6">英国短毛猫</option> 
                            <option value="7">苏格兰折耳猫</option> 
                            <option value="8">孟买猫</option> 
                            <option value="9">加菲猫</option> 
                            <option value="10">孟加拉豹猫</option> 
                        </select>
                        
                    <!-- <input placeholder="请输入您的宠物名">   -->
                    <!-- 复选框 
                    (0,'波斯猫'),
                    (1,'布偶猫'),
                    (2,'加拿大无毛猫'),
                    (3,'美国短毛猫'),
                    (4,'挪威森林猫'),
                    (5,'暹罗猫'),
                    (6,'英国短毛猫'),
                    (7,'苏格兰折耳猫'),
                    (8,'孟买猫'),
                    (9,'加菲猫'),
                    (10,'孟加拉豹猫');-->
                </div>
                <!-- age INT,    #宠物年龄 -->
                <div>
                    <b>宠物年龄</b>&nbsp;&nbsp;<span>(必填)</span> <br> 
                    <input class="txtinput" v-model="page"> 
                </div>
                <!-- details VARCHAR(256),#宠物详情 -->
                <div>
                    <b>宠物详情</b>&nbsp;&nbsp;<span>(必填)</span> <br> 
                    <input class="txtinput" v-model="details"> 
                </div>
                <!-- price DECIMAL(10,2),#价格 -->
                <div>
                    <b>预期价格</b>&nbsp;&nbsp;<span>(必填)</span> <br> 
                    <input class="txtinput" v-model="price">  
                </div>
                <!-- oldmaster VARCHAR(32),#宠物原主 -->
                <div>
                <b>联系人</b>&nbsp;&nbsp;<span>(必填)</span> <br> 
                    <input class="txtinput" v-model="master"> 
                </div>
                <!-- phone   CHAR(11),    #电话 -->
                <div>
                    <b>联系电话</b>&nbsp;&nbsp;<span>(必填)</span> <br> 
                    <input class="txtinput" v-model="phone" id=""> 
                </div>
                <!-- says VARCHAR(256),#原主人寄语 -->
                <div>
                    <b>寄语</b>&nbsp;&nbsp;<span>(选填)</span> <br> 
                    <input class="txtinput" v-model="tosays"> 
                </div>
                <!-- adress     VARCHAR(128),#地址 -->
                <div>
                    <b>地址:</b> 
                        <select class="city" name="provs" @change="sel" v-model="city">
                            <option>—请选择—</option><!--0-->
                            <option>北京市</option>
                            <option>天津市</option>
                            <option>河北省</option>
                            <option>上海市</option>
                            <option>河南省</option>
                            <option>内蒙古</option>
                            <option>黑龙江</option>
                            <option>吉林省</option>
                            <option>辽宁省</option>
                            <option>安徽省</option>
                            <option>湖北省</option>
                            <option>湖南省</option>
                            <option>广州省</option>
                            <option>江西省</option>
                            <option>福建省</option>
                            <option>贵州省</option>
                            <option>四川省</option>
                            <option>山东省</option>
                            <option>山西省</option>
                            <option>陕西省</option>
                            <option>江苏省</option>
                            <option>浙江省</option>
                        </select>
                        <select name="allcities" v-show="show" v-model="cities">
                        </select>
                    <!-- 复选框 省市县 -->
                </div>
                <div>
                    <input class="txtinput" type="text" placeholder="请输入详细地址" v-model="adress">
                </div>
                <!-- saletime DATE,#寄售时间 获取当前时间-->
                <!-- is_onsale BOOLEAN,#是否可以免费认领 -->
                <div>
                    喵赠有缘：<label><input type="radio" value="1" name="sex">是</label>&nbsp;&nbsp;&nbsp;&nbsp;<label><input class="sexwoman" type="radio" value="0" name="sex" checked>否</label> 
                    <!-- 单选框 是 否 -->
                </div>
                <hr>
                <mt-button class="leftbutton" @click="submit">提交</mt-button>
                <!-- 买 -->
            </div>
        </main>
        <my-footer></my-footer>
    </div>
</template>
<script>
import Qs from 'qs';
export default {
    data(){
        return {
            allcities:[
                [
                    {"name":'东城区',"value":101},
                    {"name":'西城区',"value":102},
                    {"name":'海淀区',"value":103},
                    {"name":'朝阳区',"value":104}
                ],
                [
                    {"name":'河东区',"value":201},
                    {"name":'河西区',"value":202},
                    {"name":'南开区',"value":303}
                ],
                [
                    {"name":'石家庄市',"value":301},
                    {"name":'廊坊市',"value":302},
                    {"name":'保定市',"value":303},
                    {"name":'唐山市',"value":304},
                    {"name":'秦皇岛市',"value":304}
                ],
                [
                    {"name":'浦东区',"value":401},
                    {"name":'徐汇区',"value":402},
                    {"name":'嘉定区',"value":402},
                    {"name":'宝山区',"value":402}
                ],
                [
                    {"name":'郑州市',"value":501},
                    {"name":'洛阳',"value":502},
                    {"name":'开封',"value":502},
                    {"name":'许昌',"value":502}
                ],
                [
                    {"name":'呼和浩特市',"value":601},
                    {"name":'包头市',"value":602},
                    {"name":'乌海市',"value":603},
                    {"name":'通辽市',"value":604}
                ],
                [
                    {"name":'哈尔滨市',"value":701},
                    {"name":'齐齐哈尔市',"value":702},
                    {"name":'大庆市',"value":706},
                    {"name":'绥化市',"value":712},
                    {"name":'长春市',"value":713},
                    {"name":'榆树市',"value":714}
                ],
                [
                    {"name":'吉林市',"value":801},
                    {"name":'白山市',"value":807},
                    {"name":'临江市',"value":808},
                    {"name":'松原市',"value":809},
                    {"name":'扶余市',"value":810}
                ],
                [
                    {"name":'珲春市',"value":901},
                    {"name":'龙井市',"value":902},
                    {"name":'和龙市',"value":903},
                    {"name":'沈阳市',"value":904},
                    {"name":'丹东市',"value":910},
                    {"name":'东港市',"value":911}
                ],
                [
                    {"name":'合肥市',"value":1001},
                    {"name":'宿州市',"value":1002},
                    {"name":'淮北市',"value":1003},
                    {"name":'安庆市',"value":1011},
                    {"name":'黄山市',"value":1016}
                ],
                [
                    {"name":'武汉市',"value":1101},
                    {"name":'黄石市',"value":1102},
                    {"name":'襄阳市',"value":1103},
                    {"name":'随州市',"value":1112}
                ],
                [
                    {"name":'长沙市',"value":1201},
                    {"name":'株洲市',"value":1202},
                    {"name":'湘潭市',"value":1203},
                    {"name":'衡阳市',"value":1204}
                ],
                [
                    {"name":'广州市',"value":1301},
                    {"name":'深圳市',"value":1302},
                    {"name":'佛山市',"value":1303},
                    {"name":'东莞市',"value":1304},
                    {"name":'中山市',"value":1305},
                    {"name":'珠海市',"value":1306}
                ],
                [
                    {"name":'南昌市',"value":1401},
                    {"name":'九江市',"value":1402},
                    {"name":'上饶市',"value":1403},
                    {"name":'抚州市',"value":1404},
                    {"name":'宜春市',"value":1405}
                ],
                [
                    {"name":'福州市',"value":1501},
                    {"name":'厦门市',"value":1502},
                    {"name":'泉州市',"value":1503},
                    {"name":'漳州市',"value":1504},
                    {"name":'莆田市',"value":1505}
                ],
                [
                    {"name":'贵阳市',"value":1601},
                    {"name":'铜仁市',"value":1606},
                    {"name":'黔东南',"value":1607},
                    {"name":'黔南',"value":1608},
                    {"name":'黔西南',"value":1609}
                ],
                [
                    {"name":'成都市',"value":1701},
                    {"name":'绵阳市',"value":1702},
                    {"name":'自贡市',"value":1703},
                    {"name":'遂宁市',"value":1708},
                    {"name":'内江市',"value":1709},
                    {"name":'乐山市',"value":1710},
                    {"name":'资阳市',"value":1711}
                ],
                [
                    {"name":'济南市',"value":1801},
                    {"name":'枣庄市',"value":1802},
                    {"name":'德州市',"value":1803},
                    {"name":'济宁市',"value":1804},
                    {"name":'临沂市',"value":1805},
                    {"name":'日照市',"value":1816},
                    {"name":'潍坊市',"value":1817}
                ],
                [
                    {"name":'太原市',"value":1901},
                    {"name":'大同市',"value":1902},
                    {"name":'朔州市',"value":1903},
                    {"name":'忻州市',"value":1904}
                ],
                [
                    {"name":'西安市',"value":2001},
                    {"name":'宝鸡市',"value":2002},
                    {"name":'咸阳市',"value":2003},
                    {"name":'铜川市',"value":2004},
                    {"name":'渭南市',"value":2005}
                ],
                [
                    {"name":'南京市',"value":2101},
                    {"name":'无锡市',"value":2102},
                    {"name":'扬州市',"value":2110},
                    {"name":'镇江市',"value":2111},
                    {"name":'台州市',"value":2112},
                    {"name":'宿迁市',"value":2113}
                ],
                [
                    {"name":'杭州市',"value":2201},
                    {"name":'湖州市',"value":2202},
                    {"name":'嘉兴市',"value":2203},
                    {"name":'金华市',"value":2204},
                    {"name":'丽水市',"value":2205}
                ]
            ],
            show:false,
            pname:"",
            ptype:0,
            page:"",
            details:"",
            price:"",
            master:"",
            phone:"",
            tosays:"",
            city:"",
            cities:"",
            adress:"",
            isonsale:1
        }
    },
    methods:{
        sel(){
            var selprevo=document.getElementsByName("provs")[0];
            var selcite=document.getElementsByName("allcities")[0];
            var selid=selprevo.selectedIndex;
            if(selid==0){
                this.show=false
                return;
            }
            var cts=this.allcities[selid-1];
            var frag=document.createDocumentFragment();
            frag.appendChild(new Option("-请选择-"))
            for(var c of cts){
                frag.appendChild(new Option(c.name,c.value))
            }
            selcite.innerHTML="";
            selcite.appendChild(frag);
            this.show=true;
        },
        submit(){
            var pname=this.pname;
            var ptype=this.ptype;
            var page=this.page;
            var details=this.details;
            var price=this.price;
            var master=this.master;
            var phone=this.phone;
            var tosays=this.tosays;
            var city=this.city;
            var cities=this.cities;
            var adress=this.adress;
            var isonsale=this.isonsale;
            var url="products/sale";
            var obj={pname,ptype,page,details,price,master,phone,tosays,city,cities,adress,isonsale};
            this.axios.get(url,{params:obj}).then(res=>{
                console.log(res)
                if(res.data.code==-1){
                    this.$messagebox.confirm("提交失败,请重试").then(()=>{
                        this.$router.push("salecat");
                        $("#pname").focus(); 
                    })
                }else{
                    this.$messagebox.confirm("提交成功！审核通过后进入商品页面")
                }
            })

        }
    }
}
</script>
<style  scoped>
    select{
        line-height: 1;
        padding-bottom: 5px;
    }
    .left{
        text-align:left;
        margin-left:35%;
    }
    b{
        font-size:15px;
        font-family: Arial, Helvetica, sans-serif;
        padding-left:5px;
        color:#4c4c4c;
    }
    span{
        font-size:12px;
        color:#666;
    }
    div{
        margin:5px 0px;
    }
    .left .txtinput{
        width:360px;
        height:36px;
    }
    .left input{
        margin-bottom:10px;
    }
    .left>.leftbutton{
        background-color:#1d7ff0;
        color:aliceblue;
        width:100px;
        height:40px;
        line-height:40px;
        margin-bottom:20px;
    }
    .left .city{
        margin:0 10px 10px 10px;
    }
    .left .breed{
        margin-right:10px;
    }
    .left hr{
        width:360px;
        margin:0 0 16px 0;
    }
    .left h6{
        margin:20px 0;
    }
</style>