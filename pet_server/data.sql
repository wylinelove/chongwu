-- 数据库名称pet — —宠物
SET NAMES UTF8;
DROP DATABASE IF EXISTS pet;
CREATE DATABASE pet CHARSET=UTF8;
USE pet;
-- 创建表格
-- 1、轮播图
CREATE TABLE pet_banner(
    bid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(64),  #标题文字
    pic VARCHAR(256),
    aid INT
);
INSERT INTO pet_banner VALUES
(null,'萌宠之家，喵咪爱好者的乐园','images/carousel/5.jpg',2),
(null,'保证正品，以诚交友','images/carousel/pinzhong.jpg',3),
(null,'最贴心的的服务，最完善的售后','images/carousel/about1.jpg',4),
(null,'做一个最专业的爱喵之友','images/carousel/zhishi.jpg',5),
(null,'宠物资讯，实时更新','images/carousel/zixun.jpg',6);
-- 2、首页萌宠  
CREATE TABLE pet_cutepet(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    pic VARCHAR(256),
    cname VARCHAR(32),  #宠物名称
    min DECIMAL(10,2),  #建议售价最低价
    max DECIMAL(10,2),  #建议售价最高价
    aid INT              #宠物编号
);
INSERT INTO pet_cutepet VALUES
(null,'images/fppet/bosi.jpg','波斯猫','3000','8000','11'),
(null,'images/fppet/buou.jpg','布偶猫','6000','20000','9'),
(null,'images/fppet/wumao.jpg','加拿大无毛猫','7000','20000','20'),
(null,'images/fppet/meiduan.jpg','美国短毛猫','2500','5000','22'),
(null,'images/fppet/nwsl.jpg','挪威森林猫','1500','6000','27'),
(null,'images/fppet/zheer.jpg','折耳猫','2500','5000','29'),
(null,'images/fppet/yingduan.jpg','英国短毛猫','2200','6000','17'),
(null,'images/fppet/mengmai.jpg','孟买猫','2500','5000','29');

-- 3、首页宠物用品
CREATE TABLE pet_supply(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    pic VARCHAR(256),
    sname VARCHAR(32),      #商品名称
    details VARCHAR(64),    #商品详情
    price DECIMAL(10,2),
    pid INT                 #商品编号
);
INSERT INTO pet_supply VALUES
(null,'images/fppetjoy/1.jpg','猫罐头','babypet 白肉猫罐头主食罐','50.00',1),
(null,'images/fppetjoy/yf2.jpg','猫咪直立装','抖音同款 浦岛太喵 猫咪直立装','158.00',2),
(null,'images/fppetjoy/yf1.jpg','抓绒猫咪衣服','抓绒猫咪衣服 悟空橘色','19.8',3),
(null,'images/fppetjoy/4.jpg','猫砂盆','MEET 全自动猫砂盆','66.00',4),
(null,'images/fppetjoy/5.jpg','猫罐头湿粮','腐败猫-PurePaws 飘仕白肉猫罐头','88.00',5),
(null,'images/fppetjoy/7.jpg','猫咪玩具球','抖音同款 led闪光球激光逗猫球','70.00',7),
(null,'images/fppetjoy/8.png','除臭猫沙','格琳斯 膨润土猫砂','80.00',8),
(null,'images/fppetjoy/qys.jpg','猫绳','白领公社 猫绳 背心式胸背带','39.00',9),
(null,'images/fppetjoy/10.jpg','磨牙新品啃咬抱枕','Meowcard 网红玩具啃咬抱枕爆款','100.00',10);
-- 宠物家族
CREATE TABLE pet_family(
    fid INT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(32)
);
INSERT INTO pet_family VALUES
(0,'波斯猫'),
(null,'布偶猫'),
(null,'加拿大无毛猫'),
(null,'美国短毛猫'),
(null,'挪威森林猫'),
(null,'暹罗猫'),
(null,'英国短毛猫'),
(null,'苏格兰折耳猫'),
(null,'孟买猫'),
(null,'加菲猫'),
(null,'孟加拉豹猫');
-- 宠物用品类别
CREATE TABLE pet_sup_family(
    sfid  INT PRIMARY KEY AUTO_INCREMENT,
    sfname VARCHAR(32) 
);
INSERT INTO pet_sup_family VALUES
(0,'猫罐头'),
(null,'猫粮'),
(null,'猫砂'),
(null,'猫砂盆'),
(null,'猫玩具'),
(null,'猫服饰'),
(null,'牵引绳');
--宠物列表bcsfa 
CREATE TABLE pet_animal(
    aid INT PRIMARY KEY AUTO_INCREMENT,
    family_id INT,      #宠物品种家族编号
    title VARCHAR(128), #主标题
    subtitle VARCHAR(128),  #副标题
    price DECIMAL(10,2),#价格
    aname VARCHAR(32),#宠物名称
    age INT,    #宠物年龄
    details VARCHAR(256),#宠物详情
    oldmaster VARCHAR(32),#宠物原主
    phone   CHAR(11),    #电话
    says VARCHAR(256),#原主人寄语
    saletime DATE,#寄售时间
    is_onsale BOOLEAN,#是否可以免费认领
    lg VARCHAR(128),#大图
    md VARCHAR(128),#中图
    sm VARCHAR(128)#小图
);
INSERT INTO pet_animal VALUES
(null,5,'纯种海豹重点暹罗猫','纯种海豹重点暹罗猫幼猫活体宠物猫咪先罗猫蓝眼泰国猫短毛猫挖煤',5555,'豆包','35天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','李太白','18569587458','人生没有对错，只有选择后的坚持，不后悔，走下去，就是对的。走着走着，花就开了。','2019-08-21',0,'images/products/lg/6.jpg','images/products/md/6.jpg','images/products/sm/6.jpg'),
(null,10,'纯种金豹幼猫','孟加拉豹猫活体纯种金豹幼猫雪豹亚豹宠物猫幼崽巨型空心大玫瑰纹',7500,'菜包','40天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','杨逸飞','15678908758','生活中其实没有绝境，绝境在于你自己的心没有打开。','2019-05-23',0,'images/products/lg/7.jpg','images/products/md/7.jpg','images/products/sm/7.jpg'),
(null,7,'蓝白活体猫咪','蓝白活体猫咪折耳加菲猫英短布偶渐层蓝猫金吉拉暹罗宠物猫咪橘猫',2000,'肉包','50天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','叶芷青','13652130145','盛年不重来，一日难再晨，及时当勉励，岁月不待人','2019-06-23',1,'images/products/lg/11.jpg','images/products/md/11.jpg','images/products/sm/11.jpg'),
(null,6,'英短蓝猫幼猫','英短蓝猫幼猫活体纯种蓝白猫英短银渐层加菲猫美短猫家养猫咪活物',9999,'土豆包','28天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','孙飞亮','17754623548','自觉心是进步之母，自贱心是堕落之源，故自觉心不可无，自贱心不可有。——邹韬奋','2019-02-12',0,'images/products/lg/12.jpg','images/products/md/12.jpg','images/products/sm/12.jpg'),
(null,3,'标斑美短','美国短毛猫标斑美短虎斑加白起司猫母猫妹妹活体宠物猫家养幼猫',2300,'小梦','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','丁君','18236921038','没有人生活在过去，也没有人生活在未来，现在是生命确实占有的唯一形态。——叔本华','2019-04-12',0,'images/products/lg/1.jpg','images/products/md/1.jpg','images/products/sm/1.jpg'),
(null,6,'蓝猫幼崽','蓝猫幼崽纯种蓝白猫活体猫宠物猫折耳猫英短猫美短猫布偶猫渐层猫',5000,'小阳','40天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','沈酱侠','13862541964','心态决定看世界的眼光，行动决定生存的状态。要想活出尊严，展现不凡，只有改变观念，敢于和命运抗争！','2019-05-01',0,'images/products/lg/2.jpg','images/products/md/2.jpg','images/products/sm/2.jpg'),
(null,1,'仙女猫小浣熊','布偶猫幼猫活体幼猫纯种蓝眼睛宠物猫幼崽布偶猫仙女猫 小浣熊',7000,'小陈','35天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','何方易','18120358476','与其在风雨中逃避，不如在雷电中舞蹈，即便淋得透湿，也是领略生命的快意。','2019-08-25',1,'images/products/lg/3.jpg','images/products/md/3.jpg','images/products/sm/3.jpg'),
(null,2,'斯芬克斯无毛猫','无毛猫活体斯芬克斯无毛猫幼猫加拿大无毛猫白皮蓝眼精灵耳无毛猫',4000,'小浩','25天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','唐傲天','17625613495','每个成功者，都要穿越不为人知的黑暗。强者不是没眼泪，只是能含着眼泪向前跑。','2019-08-10',0,'images/products/lg/4.jpg','images/products/md/4.jpg','images/products/sm/4.jpg'),
(null,1,'海双布偶猫','布偶猫幼猫纯种布偶猫幼崽海双布偶猫赛级仙女猫咪活幼体猫咪活物',6000,'佳佳','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','孙思邈','17852186354','如果你想要什么，那就勇敢地去追求，不要管别人是怎么想的，因为这就是实现梦想的方式——行动。','2019-05-15',1,'images/products/lg/5.jpg','images/products/md/5.jpg','images/products/sm/5.jpg'),
(null,8,'小黑豹幼猫','深圳可上门 孟买猫纯种活体小黑豹幼猫黑猫招财僻邪猫cfa血统认证',3000,'小布','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','颜卿真','19023579642','一个人失败的最大原因，就是对于自己的能力永远不敢充分信任，甚至认为自己必将失败。','2019-08-23',1,'images/products/lg/9.jpg','images/products/md/9.jpg','images/products/sm/9.jpg'),
(null,9,'加菲猫纯种','出售纯种加菲加菲猫宠物猫加菲猫幼崽宠物猫加菲猫纯种猫咪活幼体',1666,'小汪','25天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','东方宇轩','18201475864','不要质疑你的付出，这些都会一种累积一种沉淀，它们会默默铺路，只为让你成为更优秀的人。','2019-07-15',0,'images/products/lg/10.jpg','images/products/md/10.jpg','images/products/sm/10.jpg'),
(null,6,'蓝猫英短','猫咪活物布偶幼崽宠物猫活体渐层猫猫咪活幼体蓝猫幼猫英国短毛猫',6666,'小谷','60天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','月弄痕','17456498217','不管前方的路有多苦，只要走的方向正确，不管多么崎岖不平，都比站在原地更接近幸福。','2019-03-12',0,'images/products/lg/14.jpg','images/products/md/14.jpg','images/products/sm/14.jpg'),
(null,1,'仙女猫布偶','杭州猫舍出售布偶猫活体幼猫海双布偶猫蓝双仙女猫布偶宠物猫猫咪',8888,'小瑞','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','柳惊涛','18850924851','所有的不甘，都是因为还心存梦想，在你放弃之前，好好拼一把，只怕心老，不怕路长。','2019-04-15',1,'images/products/lg/13.jpg','images/products/md/13.jpg','images/products/sm/13.jpg'),
(null,1,'家养纯种布偶','布偶猫活体幼猫宠物猫 家养纯种布偶猫海豹蓝双重点色 满背满耳',5000,'小猫','50天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','玄正','15867402001','眼泪不是答案，拼搏才是选择。只有回不了的过去，没有到不了的明天。','2019-05-25',0,'images/products/lg/8.png','images/products/md/8.png','images/products/sm/8.png'),
(null,1,'仙女蓝眼猫','北京猫舍海双布偶猫幼猫宠物仙女蓝眼猫曼基康矮脚猫布偶活体幼猫',5000,'酸菜包','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','叶凡','15923541295','每个成功者，都要穿越不为人知的黑暗。强者不是没眼泪，只是能含着眼泪向前跑。','2019-08-15',0,'images/products/lg/15.jpg','images/products/md/15.jpg','images/products/sm/15.jpg'),
(null,6,'蓝白英短','英国短毛猫活体幼崽猫咪宠物猫英短蓝白猫五粉正开八字脸灰白猫',8000,'小加松','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','叶英','176258462458','没有人生活在过去，也没有人生活在未来，现在是生命确实占有的唯一形态','2019-9-20',0,'images/products/lg/16.jpg','images/products/md/16.jpg','images/products/sm/16.jpg'),
(null,6,'纯种可爱英短','猫咪活体可爱幼猫宠物猫幼崽英短猫小猫田园猫土猫橘猫白猫活物',7500,'小任杰','40天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','方乾','15668506758','生活中其实没有绝境，绝境在于你自己的心没有打开。','2019-08-23',1,'images/products/lg/17.jpg','images/products/md/17.jpg','images/products/sm/17.jpg'),
(null,9,'清纯加菲猫','a加菲猫活体波斯猫加菲猫幼猫异国短毛猫英短蓝猫活体加菲猫宠物',3000,'小陈昊','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','姬别情','19679908968','没有人生活在过去，也没有人生活在未来，现在是生命确实占有的唯一形态','2019-05-23',0,'images/products/lg/18.jpg','images/products/md/18.jpg','images/products/sm/18.jpg'),
(null,1,'布偶小仙女','布偶猫活体宠物猫幼猫小猫活物布偶猫加菲猫缅因猫矮脚猫布偶幼猫',9999,'小威','28天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','李承恩','17754623548','自觉心是进步之母，自贱心是堕落之源，故自觉心不可无，自贱心不可有。——邹韬奋','2019-07-12',0,'images/products/lg/19.jpg','images/products/md/19.jpg','images/products/sm/19.jpg'),
(null,2,'纯种无毛猫','纯种无毛猫活体猫咪斯芬克斯猫幼猫加拿大宠物猫矮脚鸳鸯眼无毛猫',10000,'小珠','25天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','陆危楼','17568236851','每个成功者，都要穿越不为人知的黑暗。强者不是没眼泪，只是能含着眼泪向前跑。','2019-08-20',1,'images/products/lg/20.jpg','images/products/md/20.jpg','images/products/sm/20.jpg'),
(null,1,'赛级布偶','海山双蓝山布偶幼猫蓝眼睛宠物猫活体长毛猫高地幼崽布偶枫叶加菲',8000,'小冰','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','卡卢比','15478965236','一个人失败的最大原因，就是对于自己的能力永远不敢充分信任，甚至认为自己必将失败。','2019-08-23',1,'images/products/lg/21.jpg','images/products/md/21.jpg','images/products/sm/21.jpg'),
(null,3,'美短银渐层','家养纯种猫咪蓝猫渐层美国短毛蓝白金吉拉折耳布偶幼猫活体宠物猫',6000,'小宁','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','李忘生','17852196552','如果你想要什么，那就勇敢地去追求，不要管别人是怎么想的，因为这就是实现梦想的方式——行动。','2019-09-15',1,'images/products/lg/22.jpg','images/products/md/22.jpg','images/products/sm/22.jpg'),
(null,3,'美短虎斑','纯种美短猫虎斑猫幼猫活体宠物猫银虎斑标版起司加白折耳猫咪短毛',2300,'小天','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','谢云流','17568523147','没有人生活在过去，也没有人生活在未来，现在是生命确实占有的唯一形态。——叔本华','2019-06-12',0,'images/products/lg/23.jpg','images/products/md/23.jpg','images/products/sm/23.jpg'),
(null,8,'凶猛小豹猫','纯种孟加拉豹猫活体亚豹幼猫大型猫玫瑰纹宠物猫幼猫活物小猫咪',3000,'小鑫','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','于睿','15053373622','一个人失败的最大原因，就是对于自己的能力永远不敢充分信任，甚至认为自己必将失败。','2019-06-23',1,'images/products/lg/24.jpg','images/products/md/24.jpg','images/products/sm/24.jpg'),
(null,5,'蓝眼睛暹罗','泰国纯种出售海豹暹罗猫咪宠物活体幼猫真猫家养繁殖蓝眼睛猫',6000,'佳佳','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','曲云','15842283654','如果你想要什么，那就勇敢地去追求，不要管别人是怎么想的，因为这就是实现梦想的方式——行动。','2019-07-15',1,'images/products/lg/25.jpg','images/products/md/25.jpg','images/products/sm/25.jpg'),
(null,5,'纯色暹罗','预售纯种暹罗猫活体幼猫 家养宠物猫咪泰国猫海豹重点色',5000,'小猫','50天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','燕忘情','15867402591','眼泪不是答案，拼搏才是选择。只有回不了的过去，没有到不了的明天。','2019-09-25',0,'images/products/lg/26.png','images/products/md/26.png','images/products/sm/26.png'),
(null,4,'气质挪威森林猫','棕虎斑缅因猫活体大体巨型挪威森林猫红虎斑银虎斑缅因长毛爆毛猫',7300,'小梦','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','陆烟儿','18269852338','没有人生活在过去，也没有人生活在未来，现在是生命确实占有的唯一形态。——叔本华','2019-09-12',0,'images/products/lg/27.jpg','images/products/md/27.jpg','images/products/sm/27.jpg'),
(null,4,'cfa纯种','美国缅因猫活体幼猫挪威森林猫 cfa纯种缅因幼猫长毛猫巨型宠物猫',8888,'小瑞','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','王遗风','1889641351','所有的不甘，都是因为还心存梦想，在你放弃之前，好好拼一把，只怕心老，不怕路长。','2019-09-15',1,'images/products/lg/28.jpg','images/products/md/28.jpg','images/products/sm/28.jpg'),
(null,7,'绿眼折耳','纯种金吉拉活体幼猫折耳猫宠物猫咪金吉拉幼猫活体幼猫绿眼猫活体',6666,'小绿','60天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','谢渊','17649829752','不管前方的路有多苦，只要走的方向正确，不管多么崎岖不平，都比站在原地更接近幸福。','2019-09-12',0,'images/products/lg/29.jpg','images/products/md/29.jpg','images/products/sm/29.jpg'),
(null,7,'各种折耳','英国短毛折耳矮脚金银渐层猫咪活物体银点纯种宠物幼猫阿比尼西亚',8000,'球球','30天','免费送货上门 包纯种 包健康 包疫苗 驱虫加微信了解更多猫咪详情','唐老太','176452368758','没有人生活在过去，也没有人生活在未来，现在是生命确实占有的唯一形态','2019-9-20',0,'images/products/lg/30.jpg','images/products/md/30.jpg','images/products/sm/30.jpg');
--宠物商品列表 bcsfap
CREATE TABLE pet_products(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    sf_id INT,  #商品家族编号
    title VARCHAR(128),#主标题
    subtitle VARCHAR(128),#副标题
    price DECIMAL(10,2),
    details VARCHAR(256),#详情
    lg VARCHAR(128),#大图
    md VARCHAR(128),#中图
    sm VARCHAR(128),#小图
    nums INT,#库存数量
    is_onsale BOOLEAN #是否促销
);
-- 0 猫罐头 1 猫粮 2 猫砂 3 猫砂盆 4猫玩具 5 服饰  6 牵引绳
INSERT INTO pet_products VALUES
(null,0,'白肉猫罐头','babypet 白肉猫罐头主食罐100g*6增肥营养幼猫零食金枪鱼肉汤湿粮','12.9','xxx','images/products/lg/gt/2.jpg','images/products/md/gt/2.jpg','images/products/sm/gt/2.jpg',520,0),
(null,5,'浦岛太喵猫咪直立装','好嗨哟抖音同款猫衣服浦岛太郎喵咪搞笑搞怪装浦岛太喵猫咪直立装 浦岛太郎 M','158.00','xxx','images/products/lg/fushi/2-0.jpg','images/products/md/fushi/2-0.jpg','images/products/sm/fushi/2-0.jpg',520,0),
(null,5,'抓绒猫咪衣服','抓绒猫咪衣服小猫猫宠物卫衣小奶猫蓝猫幼猫英短无毛秋冬装女棉衣 悟空橘色 M(建议体重4-5斤)','19.8','xxx','images/products/lg/fushi/1-1.jpg','images/products/md/fushi/1-1.jpg','images/products/sm/fushi/1-1.jpg',520,0),
(null,1,'雪山室内成猫粮','雪山室内成猫粮6磅折耳英短加菲猫天然猫粮田园去毛球全猫粮2.7kg','34.9','xxx','images/products/lg/ml/10.jpg','images/products/md/ml/10.jpg','images/products/sm/ml/10.jpg',520,1),
(null,0,'去毛球配方猫罐头湿粮','腐败猫-PurePaws飘仕白肉去毛球配方猫罐头湿粮拼箱组合 80g*6罐','91.9','xxx','images/products/lg/gt/9.jpg','images/products/md/gt/9.jpg','images/products/sm/gt/9.jpg',520,1),
(null,4,'猫咪玩具球','抖音同款猫咪玩具球led闪光球激光逗猫球自嗨猫玩具发光自动变向','45.9','xxx','images/products/lg/mwj/2.jpg','images/products/md/mwj/2.jpg','images/products/sm/mwj/2.jpg',520,0),
(null,2,'除臭猫沙','格琳斯膨润土猫砂柠檬味无尘香砂结团猫砂5L抗菌除臭猫沙养猫常备','67.9','xxx','images/products/lg/ms/10.jpg','images/products/md/ms/10.jpg','images/products/sm/ms/10.jpg',520,0),
(null,6,'猫绳','白领公社 猫绳 背心式胸背带溜猫绳防挣脱逃脱猫链子猫咪牵引遛猫四季耐用绳子两用不勒脖衣服猫咪背带 萌点粉色 M适合6-10斤','39.00','xxx','images/products/lg/qys/1.jpg','images/products/md/qys/1.jpg','images/products/sm/qys/1-0.jpg',520,0),
(null,4,'磨牙新品啃咬抱枕','Meowcard 大鸡腿子猫薄荷猫卡逗猫网红玩具磨牙新品啃咬抱枕爆款','12.9','xxx','images/products/lg/mwj/10.jpg','images/products/md/mwj/10.jpg','images/products/sm/mwj/10.jpg',520,0),
(null,2,'水蜜桃豆腐猫砂','宠匠水蜜桃豆腐猫砂除臭无尘环保特价包邮抗菌成幼猫通用猫砂6L','56.9','xxx','images/products/lg/ms/9.jpg','images/products/md/ms/9.jpg','images/products/sm/ms/9.jpg',520,0),
(null,3,'MEET全自动猫砂盆','MEET全自动猫砂盆厕所清洁器电动全封闭智能猫咪铲屎机去臭猫沙盆','78.9','xxx','images/products/lg/msp/10.jpg','images/products/md/msp/10.jpg','images/products/sm/msp/10.jpg',520,0),
(null,3,'防外溅全半封闭猫沙盆','猫砂盆防外溅全半封闭特大号猫厕所猫屎盆拉屎猫沙盆猫咪全套用品','23.9','xxx','images/products/lg/msp/9.jpg','images/products/md/msp/9.jpg','images/products/sm/msp/9.jpg',520,1),
(null,4,'网红猫玩具','网红猫玩具打地鼠机箱猫抓板人宠互动益智玩具自嗨逗猫棒猫咪用品','89.9','xxx','images/products/lg/mwj/8.jpg','images/products/md/mwj/8.jpg','images/products/sm/mwj/8.jpg',520,1),
(null,0,'麦富迪猫咪主食罐','泰国进口猫罐头麦富迪猫咪主食罐170g12幼猫零食营养增肥湿粮整箱','34.9','xxx','images/products/lg/gt/1.jpg','images/products/md/gt/1.jpg','images/products/sm/gt/1.jpg',520,0),
(null,0,'营养增肥幼猫主食猫罐头','猫罐头包邮170g*12罐 营养增肥幼猫主食罐猫咪湿粮猫零食特价秒杀','56.9','xxx','images/products/lg/gt/3.jpg','images/products/md/gt/3.jpg','images/products/sm/gt/3.jpg',520,0),
(null,0,'鸡肉鲜肉猫罐头','猫罐头鸡肉鲜肉幼猫成猫湿粮宠物零食猫170g工厂直销鲜肉包定制','75.9','xxx','images/products/lg/gt/4.jpg','images/products/md/gt/4.jpg','images/products/sm/gt/4.jpg',520,0),
(null,0,'泰国原装进口麦富迪猫罐头','泰国原装进口麦富迪猫罐头成幼猫零食湿粮 特价秒杀 整箱12罐包邮','56.9','xxx','images/products/lg/gt/5.jpg','images/products/md/gt/5.jpg','images/products/sm/gt/5.jpg',520,0),
(null,0,'尾巴生活85度猫罐头','尾巴生活85度猫罐头 鲜肉浓汤慢炖 金枪鱼猫罐头零食猫湿粮85g','52.9','xxx','images/products/lg/gt/6.jpg','images/products/md/gt/6.jpg','images/products/sm/gt/6.jpg',520,0),
(null,0,'喵达泰国进口猫罐头','喵达泰国进口猫罐头主食罐幼猫汤罐白肉营养湿粮猫咪增肥发腮80g','55.9','xxx','images/products/lg/gt/7.jpg','images/products/md/gt/7.jpg','images/products/sm/gt/7.jpg',520,0),
(null,0,'进口渔极无谷物猫罐头','日本AkikA泰国进口渔极无谷物猫罐AY系列海鲜鱼猫罐头80g*6罐','55.9','xxx','images/products/lg/gt/8.jpg','images/products/md/gt/8.jpg','images/products/sm/gt/8.jpg',520,0),
(null,0,'九尾猫串串猫罐头','喵九仙 九尾猫串串狗猫零食猫条猫咪湿粮流质猫零食猫罐头妙鲜5包','66.9','xxx','images/products/lg/gt/10.jpg','images/products/md/gt/10.jpg','images/products/sm/gt/10.jpg',520,0),
(null,1,'好主人猫粮','【10万好评】好主人猫粮成猫专用增肥发腮英短蓝猫10成年2.5kg5斤收藏加购优先发货 不吃免邮包退!','99.9','xxx','images/products/lg/ml/1.jpg','images/products/md/ml/1.jpg','images/products/sm/ml/1.jpg',520,1),
(null,1,'小鱼干双拼粮','猫粮小鱼干双拼粮10斤成猫幼猫成年猫粮英短蓝猫咪主粮5kg通用型','50.9','xxx','images/products/lg/ml/2.jpg','images/products/md/ml/2.jpg','images/products/sm/ml/2.jpg',520,1),
(null,1,'雷米高澳丽得猫粮','雷米高澳丽得海洋鱼味成猫幼猫粮10kg英短蓝猫增肥发腮包邮20斤装10kg一袋装 非独立小包装','99.9','xxx','images/products/lg/ml/3.jpg','images/products/md/ml/3.jpg','images/products/sm/ml/3.jpg',520,1),
(null,1,'海尔仕猫粮','海尔仕猫粮10kg增肥发腮流浪猫蓝猫英短猫粮成猫幼猫通用型20斤不吃包退（不包运费） 2个月以上成幼猫通用','99.9','xxx','images/products/lg/ml/4.jpg','images/products/md/ml/4.jpg','images/products/sm/ml/4.jpg',520,1),
(null,1,'田诺营养猫粮','田诺营养猫粮三文鱼肉味10kg成猫幼猫粮猫主粮20斤海洋鱼味通用型','60.9','xxx','images/products/lg/ml/5.jpg','images/products/md/ml/5.jpg','images/products/sm/ml/5.jpg',520,1),
(null,1,'贝乐芙幼猫粮','贝乐芙幼猫粮鸡肉鳕鱼发育宝肉粒猫粮美毛天然英短猫粮主粮1.5kg','70.9','xxx','images/products/lg/ml/6.jpg','images/products/md/ml/6.jpg','images/products/sm/ml/6.jpg',520,1),
(null,1,'千色喵自制天然猫粮','千色喵自制天然猫粮成猫猫粮老年猫粮鸡肉味猫咪主粮500g1斤包邮','80.9','xxx','images/products/lg/ml/7.jpg','images/products/md/ml/7.jpg','images/products/sm/ml/7.jpg',520,1),
(null,1,'简简单单冻干猫粮','简简单单冻干猫粮全期猫粮小猫猫粮成猫猫粮10KG幼猫猫粮1.3KG','90.9','xxx','images/products/lg/ml/8.jpg','images/products/md/ml/8.jpg','images/products/sm/ml/8.jpg',520,1),
(null,1,'伊萨猫粮','伊萨猫粮10kg 幼猫成猫英短加菲波斯猫折耳猫三文鱼天然猫粮20斤','91.9','xxx','images/products/lg/ml/9.jpg','images/products/md/ml/9.jpg','images/products/sm/ml/9.jpg',520,1),
(null,2,'膨润土结团猫砂','猫砂10公斤膨润土结团猫砂除臭猫沙低尘20斤10kg多省包邮猫咪用品','110.9','xxx','images/products/lg/ms/1.jpg','images/products/md/ms/1.jpg','images/products/sm/ms/1.jpg',520,0),
(null,2,'膨润土结团去味猫砂','猫砂包邮10公斤膨润土猫沙去味20斤10kg幼猫无尘除臭结团猫咪用品','120.9','xxx','images/products/lg/ms/2.jpg','images/products/md/ms/2.jpg','images/products/sm/ms/2.jpg',520,0),
(null,2,'猫特勒豆腐猫砂','猫特勒豆腐猫砂原味绿茶水蜜桃味猫砂除臭无尘结团6L满10公斤包邮','130.9','xxx','images/products/lg/ms/3.jpg','images/products/md/ms/3.jpg','images/products/sm/ms/3.jpg',520,0),
(null,2,'无尘绿茶原味猫砂','安心【除臭豆腐猫砂】无尘绿茶原味猫沙满10公斤20公斤袋/9.9包邮','140.9','xxx','images/products/lg/ms/4.jpg','images/products/md/ms/4.jpg','images/products/sm/ms/4.jpg',520,0),
(null,2,'除臭结团吸水低尘猫砂','猫砂包邮10公斤膨润土除臭结团吸水低尘猫咪用品原味猫沙10kg20斤','150.9','xxx','images/products/lg/ms/5.jpg','images/products/md/ms/5.jpg','images/products/sm/ms/5.jpg',520,0),
(null,2,'波奇怡亲猫砂','波奇怡亲猫砂豆腐猫砂除臭结团吸附猫沙6L结团25省包邮猫咪用品','160.9','xxx','images/products/lg/ms/6.jpg','images/products/md/ms/6.jpg','images/products/sm/ms/6.jpg',520,0),
(null,2,'活性碳原生豆腐猫砂','喜宠屋 活性碳原生豆腐猫砂 高效除臭无尘猫沙豆腐砂包邮6L/袋','170.9','xxx','images/products/lg/ms/7.jpg','images/products/md/ms/7.jpg','images/products/sm/ms/7.jpg',520,0),
(null,2,'植物破碎宠物猫砂','猫砂6L5斤豆腐猫砂植物破碎宠物用猫砂卫生防臭杀菌无尘包邮免费','180.9','xxx','images/products/lg/ms/8.jpg','images/products/md/ms/8.jpg','images/products/sm/ms/8.jpg',520,0),
(null,3,'防外溅全半封闭式大号猫砂盆','猫砂盆防外溅全半封闭式大号猫厕所猫沙盆猫屎盆小号猫咪用品除臭超大空间 很防外溅 买1发3 不怕对比','99.9','xxx','images/products/lg/msp/1.jpg','images/products/md/msp/1.jpg','images/products/sm/msp/1.jpg',520,0),
(null,3,'全自动猫砂盆','全自动猫砂盆智能铲屎机猫咪电动清理器用品便盆猫沙盆猫蛋猫厕所','190.9','xxx','images/products/lg/msp/2.jpg','images/products/md/msp/2.jpg','images/products/sm/msp/2.jpg',520,0),
(null,3,'全半封闭式猫砂盆','全半封闭式猫砂盆大号小号猫咪厕所除臭防外溅猫沙猫屎盆猫咪用品','200.9','xxx','images/products/lg/msp/3.jpg','images/products/md/msp/3.jpg','images/products/sm/msp/3.jpg',520,0),
(null,3,'顶入式猫砂盆','顶入式猫砂盆全封闭式afp除臭超特大号猫咪用品防臭防外溅猫厕所','210.9','xxx','images/products/lg/msp/4.jpg','images/products/md/msp/4.jpg','images/products/sm/msp/4.jpg',520,0),
(null,3,'猫砂盆全套用品','猫砂盆防外溅全半封闭特大号猫厕所猫屎盆拉屎猫沙盆猫咪全套用品','220.9','xxx','images/products/lg/msp/5.jpg','images/products/md/msp/5.jpg','images/products/sm/msp/5.jpg',520,0),
(null,3,'全封闭式除臭猫砂盆','猫砂盆全封闭式除臭猫盆猫咪用品拉屎防外溅防臭大号猫厕所猫屎盆','230.9','xxx','images/products/lg/msp/6.jpg','images/products/md/msp/6.jpg','images/products/sm/msp/6.jpg',520,0),
(null,3,'顶入式全封闭式猫砂盆','顶入式猫砂盆全封闭式除臭猫屎盆超特大号猫沙盆防臭防外溅猫厕所','240.9','xxx','images/products/lg/msp/7.jpg','images/products/md/msp/7.jpg','images/products/sm/msp/7.jpg',520,0),
(null,3,'日本IRIS猫砂盆','日本IRIS爱丽思爱丽丝全封闭式猫砂盆肥猫厕所猫沙盆WNT510包邮','250.9','xxx','images/products/lg/msp/8.jpg','images/products/md/msp/8.jpg','images/products/sm/msp/8.jpg',520,0),
(null,4,'抓板玩具剑麻猫爬架','抓板玩具剑麻猫爬架瓦楞纸窝猫咪用品耐磨磨爪器逗猫蹭痒猫抓柱','260.9','xxx','images/products/lg/mwj/1.jpg','images/products/md/mwj/1.jpg','images/products/sm/mwj/1.jpg',520,0),
(null,4,'猫墙角蹭毛器','猫墙角蹭毛器猫咪挠痒痒玩具蹭痒器按摩刷宠物用品猫用蹭脸猫抓板','270.9','xxx','images/products/lg/mwj/3.jpg','images/products/md/mwj/3.jpg','images/products/sm/mwj/3.jpg',520,0),
(null,4,'猫薄荷鱼','猫玩具鱼猫薄荷鱼3d猫玩具逗猫棒猫猫磨牙小猫抱枕宠物仿真猫咪玩','280.9','xxx','images/products/lg/mwj/4.jpg','images/products/md/mwj/4.jpg','images/products/sm/mwj/4.jpg',520,0),
(null,4,'宠物不倒翁','宠物不倒翁猫玩具球耐咬','99.9','xxx','images/products/lg/mwj/5.jpg','images/products/md/mwj/5.jpg','images/products/sm/mwj/5.jpg',520,0),
(null,4,'猫抓板','猫咪玩耍玩具瓦楞纸带球猫抓板猫磨爪器猫咪用品逗猫转盘球猫娱乐','290.9','xxx','images/products/lg/mwj/6.jpg','images/products/md/mwj/6.jpg','images/products/sm/mwj/6.jpg',520,0),
(null,4,'猫玩具小老鼠','猫玩具小老鼠逗猫益智解压玩具成幼猫纯色短毛绒响珠玩具猫咪用品','300.9','xxx','images/products/lg/mwj/7.jpg','images/products/md/mwj/7.jpg','images/products/sm/mwj/7.jpg',520,0),
(null,4,'自嗨逗猫棒','.猫玩具自嗨逗猫棒 包邮小羽毛猫铃铛耐啃咬仙女幼猫神器猫咪用品','310.9','xxx','images/products/lg/mwj/9.jpg','images/products/md/mwj/9.jpg','images/products/sm/mwj/9.jpg',520,0);
-- 用户信息
CREATE TABLE pet_master(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32),
    upwd VARCHAR(32),
    email VARCHAR(64),
    phone VARCHAR(20),
    gender TINYINT  #性别 1——男 0——女
);
INSERT INTO pet_master VALUES
(null,'xbh',md5('123456'),'254125@126.com','18254789658',1);
-- 卖家提交寄售宠物信息
CREATE TABLE pet_salepets(
    id  INT PRIMARY KEY AUTO_INCREMENT,
    pname VARCHAR(12),
    ptype TINYINT,
    page SMALLINT,
    details VARCHAR(256),
    price DECIMAL(10,2),
    master VARCHAR(16),
    phone TINYINT,
    tosays VARCHAR(128),
    city VARCHAR(12),
    cities VARCHAR(12),
    adress VARCHAR(128),
    isonsale BOOLEAN
);
--购物车
CREATE TABLE pet_pro_carts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    pid INT,        #商品编号
    price DECIMAL(10,2),
    pname VARCHAR(32),      #详情列表中的title
    details VARCHAR(128),          #详情列表中的subtitle
    pic VARCHAR(64),
    count SMALLINT,         #商品数量
    uid TINYINT             #用户编号 
);
-- --宠物知识普及
CREATE TABLE pet_msg(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32),          #标题
    showday  DATE,               #发表日期
    nums  INT,                  #浏览次数
    details VARCHAR(512),      #宠物详情
    pic VARCHAR(256)           #图片
);
INSERT INTO pet_msg VALUES
(null,"养猫必看:宠物猫的饲养经验分享!",'2019-09-20',"4544","作为一个养猫新手来说的饲养猫咪看似简单但是真正自己养的时候就出现很多问题比如宠物猫的动不动拉肚子厌食挑食各种坏习惯，这些都是由于主人在饲养的时候没有一个合理的饲养方法所造成的，那么接下来我们将饲养多年猫咪的宝贵经验做一分享： 首先猫咪到新家之后将厕所放在猫猫容易找到的地方，用纸擦PP丢到厕所里抱猫猫去闻，不能直接喂自来水，建议用凉开水或纯净水，猫粮少量喂食，猫猫到家一周后才能洗澡，完全健康情况...","images/news/1.jpg"),
(null,'为什么30多岁女性喜欢饲养暹罗猫!','2019-09-19',5473,'暹罗猫经常被误解为狗狗，其实的暹罗猫的长得有几分相似狗狗近年来暹罗猫算是已经很普及了，而且数据统计的饲养暹罗猫的大多数是30岁左右的女性朋友比较多这到底是是为什么呢？接下来我们就一起看看吧！ 先说说暹罗猫的颜色吧毛颜色较深，暹罗猫的细分种类也很多，乳黄重点色猫，红色斑点色猫，淡紫色重点色猫，蓝色重点色猫，巧克力色重点色猫，以及各色的轻虎斑重点色猫，其中最常见，最为大家熟知的就是海豹重点色猫，这...','images/news/2.jpg'),
(null,'2019年孟加拉豹猫新知识科普!','2019-09-19',5240,'孟加拉豹猫是众多品种猫当中的比较少见的而且有为数不多的宠物猫了，但很多宠物猫宠主的对孟加拉豹猫的相关知识不了解，似乎孟加拉豹猫并不像其他宠物猫那么的有影响力了，并非如此孟加拉豹猫属于贵族猫咪了，接下来我们就一起看看吧！ 孟加拉豹猫是非常新的品种，现在的小豹子跟十年前比都有翻天覆地的变化。全世界的孟加拉豹猫繁育人在繁育的过程中，还在不断探讨与争论这个品种的发展方向。因此国内还非常流行探讨美血...','images/news/3.jpg'),
(null,'养宠物猫可能会得这五种的病毒性疾病!','2019-09-16',4709,'宠物猫可能会得这五种的病毒性疾病！宠物猫在饲养的时候的很容易出现的五种病毒性疾病，只要的这种基本患有病毒性那么猫咪就有可能会死亡的可能性，宠物猫的要及时的预防这种疾病的感染，接下来我们就详细的介绍一下吧： 1.猫咪会频繁腹泻  猫细小的后期阶段是导致猫咪腹泻，一般为带血的水状排泄物，味道比较臭...','images/news/4.jpg'),
(null,'猫咪精神状态不好厌食不吃饭怎么办?','2019-09-16',4574,'猫咪紧急状态不好厌食不吃饭怎么办？在现实生活中饲养宠物猫对于的每个宠主来说的是不可缺少的，而且对于如何正确饲养宠物猫的方法也是很重要的经常会遇到的猫咪精神状态不好而且厌食不吃饭到底怎么办呢？接下来我们就一起看看吧！ 虽然宠物猫厌食挑食不吃饭的正常很平常，要确定一下是不是因为毛球症所引起的，当猫咪处于换毛期的时候经常会发生猫咪不爱吃饭精神不好的情况，宠物猫不爱吃饭一方面和铲屎官们的喂...','images/news/5.jpg'),
(null,'深度剖析2019年宠物猫价格贵的原因!','2019-09-15',5209,'很多网友表示今年的2019年的宠物猫的价格有普遍上涨的迹象，有多个品种猫咪的价格都有不同程度的上涨如布偶猫，波斯猫,加菲猫等多种猫咪价格上涨到300元到800元左右的价格这到底是为什么呢？接下来我们就一起看看吧！ 宠物猫的日用品之类的，那么价格可能就会有一些上涨了。所以在物价上涨的同时，宠物猫的价格上涨也是比较正常的一个现象，都知道我们的社会发展是有一个水涨船高的现象的。这个现象不仅在我们的吃...','images/news/6.jpg'),
(null,'宠物猫挑选方法论适合养猫新手收藏!','2019-09-15',5361,'现实生活中宠物猫饲养成为生活中的小插曲那么在购买自己喜欢的猫咪当中最重要的一环就是的挑选宠物猫的过程，尤其是刚开始饲养猫咪的新手来说挑选猫咪的还真是一个技术活，一旦猫咪选择不好主人就会的很后悔这样猫咪也不会得到很好的饲养，因此接下来就让小编分享几个适合养猫新手挑选猫咪的好方法吧！ 首先在当地实体的猫舍挑选自己的喜欢的宠物猫的时候一定要注意猫咪的血统是否纯种，判断猫咪的血统要么有猫咪...','images/news/7.jpg'),
(null,'如何增加宠物猫的寿命?','2019-09-12',4616,'宠物猫的生命在大多数人眼里也就只有的12年到15年左右吧，但是大多数人都没有的办法能够让宠物猫活的更久一点儿的，能够让猫咪的寿命增加陪伴主人的时间更长一些，接下来小编就分享一下关于如何的增加宠物猫寿命的技巧和方法！ 随着年龄的增长，更有必要带猫咪去医院去做检查。例如，取血样(也有可能是尿样或便样)、检查内脏器官的健康状况，前提当然是您要带猫咪去做常规检查。 ','images/news/8.jpg'),
(null,'2019年月饼节送你猫咪可好?','2019-09-11',4649,'2019年月饼节送你猫咪可好?众所周知月饼节就要到了也就是我们常说的中秋节，但是的总喜欢称为月饼节能够吃到月饼的节日，而月饼也成为了的朋友相送维护感情道具但是有个想法可能会让你大呼小叫月饼作为中秋节的礼物是很合理的但月饼是死的想不想让你的礼物有生命让你们的感情永久长存呢？那就是送给朋友一只宠物猫，亲爱的这不是玩笑！ 嗯，就是就是怎么对方宠物猫一只可以让你们的感情枢纽一直维持下去就像猫咪的生命一样...','images/news/9.jpg'),
(null,'宠物喂养技巧：饲养暹罗猫有你好受的!','2019-09-10',5266,'生活中饲养宠物猫似乎成为了生活提升的标签，饲养猫咪的过程就是在享受人生的过程，暹罗猫的饲养技巧是很多宠物猫宠主不知道的，其实每个宠物猫的生活习性不相同所带来的生活方式也是不一样的，关于暹罗猫喂养技巧有几句想说的： CFA识别四种暹罗猫颜色：咖啡色、巧克力色、蓝色和淡紫色点。如果说我们发现有其他颜色的这种暹罗猫的话，在这个阶段里面，暹罗猫是非常爱生病的，我们要不断的去照顾它们。','images/news/10.jpg'),
(null,'网上购买活体布偶猫需要注意哪些事项?','2019-09-10',4704,'说到购买宠物猫的大家最关心的是在网上购买布偶猫的时候需要注意些什么的问题？很多宠主通过网上购买猫咪很容易被忽视的问题有哪些？接下来我们就一起分析一下避免让更多的宠主上当，好了一起来看看吧！ 首先在网上的购买猫咪的肯定要比实体店要便宜实惠很多但是网上购买猫咪确实需要承担很多风险，在购买布偶猫的时候都是通过视频进行选猫的通常这个时候是出现问题比较多的环节，因为大多数的视频挑选的猫咪的都是通过视频处理...','images/news/1.jpg'),
(null,'宠物猫品种科普：缅因猫了解一下!','2019-09-9',5585,'宠物猫的品种有很多而缅因猫就是比较稀缺的猫咪品种了很多宠物猫专卖店都缺席缅因猫，在一二线城市的缅因猫的价格确实很高但饲养缅因猫的都是男性居多，不仅如此缅因猫的食量也是普通品种猫的三倍之多，被称为宠物猫当中身型巨大的猫咪，接下来我们就一起了解下缅因猫吧！ 一般的宠物猫咪都是比较温柔可爱小巧的，而免疫猫却完全不一样，体积这么大，有些人甚至是不敢相信或者是有点害怕。','images/news/2.jpg'),
(null,'郑州纯种豹猫价格多少钱?','2019-09-9',4905,'郑州纯种豹猫价格多少钱？说起豹猫大家可能都不曾见过豹猫的是不是近些年来豹猫失宠了呢？郑州纯种的豹猫价格如何呢？这是很多人比较关心的问题了，其实豹猫在我国一线城市的销量还是很高的，接下来我们就来看看郑州的豹猫市场吧！ 郑州豹猫的价格也是很多人比较关心的问题了，在郑州当地的豹猫数量上也不断减少也就增加了豹猫的价格，因此时候面上就有了大量的串串豹猫，看起来很像但不是真正的豹猫血统，但是价格很低廉吸引了...','images/news/3.jpg'),
(null,'2019年北京正规猫舍的德文卷毛猫多少钱一只?','2019-09-8',4592,'2019年北京正规猫舍的德文卷毛猫价格多少钱一只？德文卷毛猫品种猫可能很多宠主都没有听说过的猫咪作为北京一线城市来说的德文卷毛猫是个稀奇的品种猫，在北京的德文卷毛猫的价钱的到底多少钱呢接下来我们就看看小编怎么说： 德文卷毛猫的价格最近这几年以来的价格趋势也是在不断的涨价，最初被人们发现于英国德文郡，不过德文卷毛猫容易罹患缅甸猫低钾血症，这种病也被称为家族型阵发性低钾血症多重肌肉病变，这是一种对...','images/news/4.jpg'),
(null,'养猫的意义何在？爱猫人士购买宠物猫到底图什么?','2019-09-7',4921,'现实生活中有很多人对饲养宠物猫持有偏见的，见不得家里饲养宠物猫的人，似乎把家里的猫咪或者狗狗当成的自己的命来看待，那么到底宠主开销几千上万元的购买猫咪到底图什么？接下来我们就说说吧！ 首先对这个话题持有中立的态度来看，有花几千上完的钱买只小猫还不如对自己的父母好一点儿，几千块可以给父母买一些很食用的东西，带父母旅游一下尽个孝心，也有见到自家的猫咪生病死亡了自己哭天喊地，小编是看不惯这些的，因为...','images/news/5.jpg');


































































































































































































