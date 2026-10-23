import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jicun/ui/glass.dart'; // GlassPanel, SubPage, TopFadeListView
import 'package:jicun/ui/palette.dart'; // Palette

/// 车标大全（品牌档案 + 旗下主力车型）
/// 移植自 10-05landezhaole 的 CarBrandSection.kt + CarModelsData.kt
class CarBrandToolPage extends StatefulWidget {
  const CarBrandToolPage({super.key});
  static const String pageTitle = '车标大全';

  @override
  State<CarBrandToolPage> createState() => _CarBrandToolPageState();
}

// ---------- 数据模型 ----------

class CarModel {
  final String name;
  final String type;
  final String power;
  final String price;
  final bool smartDrive;
  final String pros;
  final String cons;

  const CarModel({
    required this.name,
    required this.type,
    required this.power,
    required this.price,
    required this.smartDrive,
    required this.pros,
    required this.cons,
  });
}

class CarBrand {
  final String id;
  final String nameZh;
  final String nameEn;
  final String country;
  final String category;
  final String foundingYear;
  final String slogan;
  final String headquarters;
  final String priceRange;
  final String logoDescription;

  const CarBrand({
    required this.id,
    required this.nameZh,
    required this.nameEn,
    required this.country,
    required this.category,
    required this.foundingYear,
    required this.slogan,
    required this.headquarters,
    required this.priceRange,
    required this.logoDescription,
  });

  String get logoAsset => 'assets/lzdz/car_logos/$id.png';
}

const List<CarBrand> kCarBrands = [
  CarBrand(
    id: 'vw',
    nameZh: '大众',
    nameEn: 'Volkswagen',
    country: '德国 🇩🇪',
    category: '德系名车',
    foundingYear: '1937年',
    slogan: 'Das Auto (车之道，唯大众)',
    headquarters: '德国 下萨克森州 沃尔夫斯堡',
    priceRange: '8万 - 65万元',
    logoDescription: '圆环中上下排列的“V”与“W”字母，代表德语 Volks (人民) 与 Wagen (汽车)，象征人民的汽车。',
  ),
  CarBrand(
    id: 'bmw',
    nameZh: '宝马',
    nameEn: 'BMW (Bayerische Motoren Werke)',
    country: '德国 🇩🇪',
    category: '德系名车',
    foundingYear: '1916年',
    slogan: 'The Ultimate Driving Machine (纯粹驾驶乐趣)',
    headquarters: '德国 巴伐利亚州 慕尼黑',
    priceRange: '20万 - 260万元',
    logoDescription: '经典的黑环圆盘内嵌蓝白四等分扇形，源自巴伐利亚自由邦州旗色彩，亦形似旋转的蓝天白云飞机螺旋桨。',
  ),
  CarBrand(
    id: 'maybach',
    nameZh: '迈巴赫',
    nameEn: 'Maybach',
    country: '德国 🇩🇪',
    category: '超豪华车',
    foundingYear: '1909年',
    slogan: '至臻奢华，传世匠心',
    headquarters: '德国 斯图加特',
    priceRange: '140万 - 500万元以上',
    logoDescription: '两个交错相叠的大写“M”字母（Maybach Motorenbau），镶嵌于三角形曲面圆弧盾形之中，代表顶级尊贵与奢华旗舰。',
  ),
  CarBrand(
    id: 'benz',
    nameZh: '梅赛德斯-奔驰',
    nameEn: 'Mercedes-Benz',
    country: '德国 🇩🇪',
    category: '德系名车',
    foundingYear: '1886年',
    slogan: 'The Best or Nothing (唯有最好)',
    headquarters: '德国 斯图加特',
    priceRange: '25万 - 350万元',
    logoDescription: '银色圆环内嵌立体的三叉星徽，象征着向陆、海、空三大维度的机械全能征服与开拓。',
  ),
  CarBrand(
    id: 'audi',
    nameZh: '奥迪',
    nameEn: 'Audi',
    country: '德国 🇩🇪',
    category: '德系名车',
    foundingYear: '1909年',
    slogan: 'Vorsprung durch Technik (突破科技·启迪未来)',
    headquarters: '德国 巴伐利亚州 因戈尔施塔特',
    priceRange: '18万 - 230万元',
    logoDescription: '著名的四环相扣，代表1932年合并组建汽车联盟的四家传奇历史汽车公司（小奇迹、霍希、奥迪、漫游者）。',
  ),
  CarBrand(
    id: 'porsche',
    nameZh: '保时捷',
    nameEn: 'Porsche',
    country: '德国 🇩🇪',
    category: '超豪华车',
    foundingYear: '1931年',
    slogan: 'Driven by Dreams (生于赛道，驰于梦想)',
    headquarters: '德国 斯图加特',
    priceRange: '55万 - 300万元以上',
    logoDescription: '金黄盾牌上方的“PORSCHE”字样、符腾堡州红黑条纹与鹿角、中央为斯图加特跃马，底蕴浓郁。',
  ),
  CarBrand(
    id: 'ferrari',
    nameZh: '法拉利',
    nameEn: 'Ferrari',
    country: '意大利 🇮🇹',
    category: '超豪华车',
    foundingYear: '1947年',
    slogan: 'Essere Ferrari (极致速度与赛道荣耀)',
    headquarters: '意大利 马拉内罗',
    priceRange: '280万 - 800万元以上',
    logoDescription: '金黄盾牌底色取自摩德纳市市旗，中央为传奇的一战空战英雄跃马（Cavallino Rampante），顶部为意大利三色旗条纹。',
  ),
  CarBrand(
    id: 'lamborghini',
    nameZh: '兰博基尼',
    nameEn: 'Lamborghini',
    country: '意大利 🇮🇹',
    category: '超豪华车',
    foundingYear: '1963年',
    slogan: 'Expect the Unexpected (不妥协的蛮牛狂飙)',
    headquarters: '意大利 圣亚加塔·波隆尼',
    priceRange: '260万 - 900万元以上',
    logoDescription: '黑色盾牌金边内嵌一头蓄势待发、肌肉喷张的金色狂怒公牛，象征不甘示弱与狂暴马力。',
  ),
  CarBrand(
    id: 'rolls_royce',
    nameZh: '劳斯莱斯',
    nameEn: 'Rolls-Royce',
    country: '英国 🇬🇧',
    category: '超豪华车',
    foundingYear: '1904年',
    slogan: 'The Best Car in the World (世界名车殿堂巅峰)',
    headquarters: '英国 西萨塞克斯郡 古德伍德',
    priceRange: '500万 - 1500万元以上',
    logoDescription: '立式矩形徽标内的重叠重影“RR”双字，配合车头傲立的欢庆女神（Spirit of Ecstasy）立标。',
  ),
  CarBrand(
    id: 'bentley',
    nameZh: '宾利',
    nameEn: 'Bentley',
    country: '英国 🇬🇧',
    category: '超豪华车',
    foundingYear: '1919年',
    slogan: 'To build a fast car, a good car (速度与贵族典雅)',
    headquarters: '英国 柴郡 克鲁',
    priceRange: '250万 - 600万元',
    logoDescription: '雄鹰展翅飞翔的银色双翼中央镶嵌醒目的字母“B”，展现出速度、力量与英伦贵族格调。',
  ),
  CarBrand(
    id: 'tesla',
    nameZh: '特斯拉',
    nameEn: 'Tesla',
    country: '美国 🇺🇸',
    category: '新能源车',
    foundingYear: '2003年',
    slogan: 'Accelerate the World\'s Transition to Sustainable Energy',
    headquarters: '美国 得克萨斯州 奥斯汀',
    priceRange: '23万 - 95万元',
    logoDescription: '极具未来科技感的大写字母“T”，设计灵感来自电动交流感应电机的横截面构造。',
  ),
  CarBrand(
    id: 'byd',
    nameZh: '比亚迪',
    nameEn: 'BYD (Build Your Dreams)',
    country: '中国 🇨🇳',
    category: '新能源车',
    foundingYear: '1995年',
    slogan: 'Build Your Dreams (成就梦想 · 绿色出行)',
    headquarters: '中国 广东省 深圳市',
    priceRange: '7万 - 110万元',
    logoDescription: '现代流线扁平化无框“BYD”字母，线条如行云流水般流畅，代表开放、灵动与技术为王。',
  ),
  CarBrand(
    id: 'nio',
    nameZh: '蔚来',
    nameEn: 'NIO',
    country: '中国 🇨🇳',
    category: '新能源车',
    foundingYear: '2014年',
    slogan: 'Blue Sky Coming (蔚来已来)',
    headquarters: '中国 上海市',
    priceRange: '29万 - 80万元',
    logoDescription: '上方半弧代表仰望天空与憧憬，下方半弧代表向前延伸的大道与地平线，寓意纯净未来。',
  ),
  CarBrand(
    id: 'xiaomi',
    nameZh: '小米汽车',
    nameEn: 'Xiaomi EV (SU7)',
    country: '中国 🇨🇳',
    category: '新能源车',
    foundingYear: '2021年',
    slogan: '人车家全生态 · 为小米汽车而战',
    headquarters: '中国 北京市 亦庄',
    priceRange: '21.59万 - 29.99万元',
    logoDescription: '银质立体方圆盾标内嵌经典“MI”标志，寓意移动互联网（Mobile Internet）与不可能完成的任务（Mission Impossible）。',
  ),
  CarBrand(
    id: 'toyota',
    nameZh: '丰田',
    nameEn: 'Toyota',
    country: '日本 🇯🇵',
    category: '日系经典',
    foundingYear: '1937年',
    slogan: '车到山前必有路，有路必有丰田车',
    headquarters: '日本 爱知县 丰田市',
    priceRange: '8万 - 90万元',
    logoDescription: '三个椭圆组成，大椭圆代表地球，两个互相垂直交叉的小椭圆代表客户与企业心心相印。',
  ),
  CarBrand(
    id: 'volvo',
    nameZh: '沃尔沃',
    nameEn: 'Volvo',
    country: '瑞典 🇸🇪',
    category: '欧系名车',
    foundingYear: '1927年',
    slogan: 'For Life (安全即豪华 · 守护生命)',
    headquarters: '瑞典 哥德堡',
    priceRange: '25万 - 65万元',
    logoDescription: '银色圆环右上角带有斜向上的箭矛符号，源自古罗马战神玛尔斯铁符号，象征坚不可摧的钢铁安全。',
  ),
  CarBrand(
    id: 'hongqi',
    nameZh: '红旗',
    nameEn: 'Hongqi',
    country: '中国 🇨🇳',
    category: '国产豪华',
    foundingYear: '1958年',
    slogan: '理想飞扬，旗领未来 (国车典范 · 民族骄傲)',
    headquarters: '中国 吉林省 长春市',
    priceRange: '15万 - 700万元以上',
    logoDescription: '经典的垂直红色中线经纬车标与飞翼立体红旗旗帜，象征中流砥柱、昂扬向上的东方尊贵气度。',
  ),
  CarBrand(
    id: 'lexus',
    nameZh: '雷克萨斯',
    nameEn: 'Lexus',
    country: '日本 🇯🇵',
    category: '日系经典',
    foundingYear: '1989年',
    slogan: 'Experience Amazing (领未见 · 探非凡)',
    headquarters: '日本 爱知县 名古屋市',
    priceRange: '28万 - 180万元',
    logoDescription: '圆润椭圆内嵌精细倾斜大写字母“L”，线条优雅流畅，诠释极致工艺与东方匠人静谧之美。',
  ),
  CarBrand(
    id: 'li_auto',
    nameZh: '理想汽车',
    nameEn: 'Li Auto',
    country: '中国 🇨🇳',
    category: '新能源车',
    foundingYear: '2015年',
    slogan: '创造移动的家，创造幸福的家',
    headquarters: '中国 北京市 顺义区',
    priceRange: '24万 - 56万元',
    logoDescription: '两个现代硬朗笔画组成的字母“LI”，形如稳固通达的未来建筑框架，象征科技守护家庭出行。',
  ),
  CarBrand(
    id: 'maserati',
    nameZh: '玛莎拉蒂',
    nameEn: 'Maserati',
    country: '意大利 🇮🇹',
    category: '超豪华车',
    foundingYear: '1914年',
    slogan: 'Luxury, sports and style cast in every car',
    headquarters: '意大利 摩德纳',
    priceRange: '70万 - 350万元以上',
    logoDescription: '取自博洛尼亚马焦雷广场海神波塞冬手持的威武三叉戟，象征无穷动力、海洋神威与狂暴竞速灵魂。',
  ),
  CarBrand(
    id: 'geely',
    nameZh: '吉利',
    nameEn: 'Geely',
    country: '中国 🇨🇳',
    category: '中国品牌',
    foundingYear: '1986年',
    slogan: '造每个人的精品车',
    headquarters: '浙江 杭州',
    priceRange: '5万 - 30万元',
    logoDescription: '盾形徽标内六块宝石菱形，象征吉利聚焦战略与品牌使命，蓝色代表天空与梦想。',
  ),
  CarBrand(
    id: 'greatwall',
    nameZh: '长城',
    nameEn: 'Great Wall / GWM',
    country: '中国 🇨🇳',
    category: '中国品牌',
    foundingYear: '1984年',
    slogan: '专注、专业、专家',
    headquarters: '河北 保定',
    priceRange: '7万 - 35万元',
    logoDescription: '烽火台造型徽标，取自万里长城烽火台意象，象征坚固可靠与中国力量。',
  ),
  CarBrand(
    id: 'chery',
    nameZh: '奇瑞',
    nameEn: 'Chery',
    country: '中国 🇨🇳',
    category: '中国品牌',
    foundingYear: '1997年',
    slogan: '技术奇瑞',
    headquarters: '安徽 芜湖',
    priceRange: '5万 - 25万元',
    logoDescription: '椭圆环绕的“CAC”变形字母，中间“A”如支撑的人字，寓意奇瑞公司团结奋进。',
  ),
];

const List<String> kCarCategories = [
  '全部',
  '德系名车',
  '超豪华车',
  '新能源车',
  '国产豪华',
  '日系经典',
  '欧系名车',
  '中国品牌',
];

/// 各品牌旗下主力车型（v1.4.26，真实在售/近期在售车型，人民币指导价）
const Map<String, List<CarModel>> kCarModels = {
  'vw': [
    CarModel(name: '朗逸', type: '轿车', power: '燃油', price: '9万 - 15万元', smartDrive: false, pros: '皮实耐用保值率高', cons: '内饰塑料感较强'),
    CarModel(name: '速腾', type: '轿车', power: '燃油', price: '13万 - 18万元', smartDrive: true, pros: '空间大底盘扎实', cons: '动力偏肉'),
    CarModel(name: '帕萨特', type: '轿车', power: '燃油', price: '18万 - 25万元', smartDrive: true, pros: '商务气质配置全', cons: '后排地台凸起'),
    CarModel(name: '途观L', type: 'SUV', power: '燃油', price: '19万 - 28万元', smartDrive: true, pros: '空间大动力够用', cons: '油耗偏高'),
    CarModel(name: '探岳', type: 'SUV', power: '燃油', price: '18万 - 25万元', smartDrive: true, pros: '外观年轻配置高', cons: '后备箱偏小'),
    CarModel(name: 'ID.4 CROZZ', type: 'SUV', power: '纯电', price: '19万 - 29万元', smartDrive: true, pros: '续航实在做工好', cons: '车机反应偏慢'),
    CarModel(name: '高尔夫', type: '轿车', power: '燃油', price: '13万 - 17万元', smartDrive: false, pros: '操控经典两厢灵活', cons: '空间局促'),
  ],
  'bmw': [
    CarModel(name: '3系', type: '轿车', power: '燃油', price: '30万 - 40万元', smartDrive: true, pros: '操控标杆驾驶乐趣足', cons: '保养费用高'),
    CarModel(name: '5系', type: '轿车', power: '燃油/混动', price: '44万 - 56万元', smartDrive: true, pros: '商务豪华均衡', cons: '低配动力一般'),
    CarModel(name: 'X3', type: 'SUV', power: '燃油', price: '40万 - 48万元', smartDrive: true, pros: '操控好的SUV', cons: '后排空间一般'),
    CarModel(name: 'X5', type: 'SUV', power: '燃油', price: '62万 - 75万元', smartDrive: true, pros: '气场足综合实力强', cons: '价格坚挺优惠少'),
    CarModel(name: 'iX3', type: 'SUV', power: '纯电', price: '40万 - 45万元', smartDrive: true, pros: '电耗低续航实在', cons: '智能化偏保守'),
    CarModel(name: '2系', type: '轿车', power: '燃油', price: '27万 - 32万元', smartDrive: false, pros: '入门宝马价格亲民', cons: '内饰用料一般'),
  ],
  'maybach': [
    CarModel(name: 'S级 迈巴赫S480', type: '轿车', power: '燃油', price: '146万 - 168万元', smartDrive: true, pros: '极致奢华后排享受', cons: '价格高昂'),
    CarModel(name: '迈巴赫S680', type: '轿车', power: '燃油', price: '326万 - 348万元', smartDrive: true, pros: 'V12旗舰身份象征', cons: '油耗惊人'),
    CarModel(name: '迈巴赫GLS480', type: 'SUV', power: '燃油', price: '183万 - 205万元', smartDrive: true, pros: '大型豪华SUV标杆', cons: '车身庞大难停车'),
    CarModel(name: '迈巴赫EQS SUV', type: 'SUV', power: '纯电', price: '160万 - 180万元', smartDrive: true, pros: '电动旗舰静谧舒适', cons: '充电网络依赖'),
    CarModel(name: '迈巴赫S580', type: '轿车', power: '燃油', price: '248万 - 268万元', smartDrive: true, pros: 'V8动力储备充沛', cons: '维修保养昂贵'),
  ],
  'benz': [
    CarModel(name: 'C级', type: '轿车', power: '燃油', price: '33万 - 39万元', smartDrive: true, pros: '豪华感强内饰精致', cons: '1.5T动力偏弱'),
    CarModel(name: 'E级', type: '轿车', power: '燃油', price: '45万 - 60万元', smartDrive: true, pros: '行政座驾标杆', cons: '选装价格高'),
    CarModel(name: 'S级', type: '轿车', power: '燃油', price: '96万 - 204万元', smartDrive: true, pros: '旗舰舒适性无敌', cons: '贬值较快'),
    CarModel(name: 'GLC', type: 'SUV', power: '燃油', price: '43万 - 53万元', smartDrive: true, pros: '均衡豪华SUV', cons: '七座版第三排挤'),
    CarModel(name: 'GLE', type: 'SUV', power: '燃油', price: '70万 - 88万元', smartDrive: true, pros: '气场强大通过性好', cons: '油耗高'),
    CarModel(name: 'EQE', type: '轿车', power: '纯电', price: '48万 - 63万元', smartDrive: true, pros: '电动豪华静谧', cons: '续航打折明显'),
    CarModel(name: 'A级', type: '轿车', power: '燃油', price: '25万 - 30万元', smartDrive: false, pros: '入门奔驰三叉星', cons: '空间小动力弱'),
  ],
  'audi': [
    CarModel(name: 'A4L', type: '轿车', power: '燃油', price: '32万 - 40万元', smartDrive: true, pros: '科技感强优惠大', cons: '转向手感偏轻'),
    CarModel(name: 'A6L', type: '轿车', power: '燃油', price: '43万 - 66万元', smartDrive: true, pros: '官车气质空间大', cons: '低配配置一般'),
    CarModel(name: 'Q5L', type: 'SUV', power: '燃油', price: '40万 - 49万元', smartDrive: true, pros: '均衡实用保值', cons: '内饰设计偏旧'),
    CarModel(name: 'Q7', type: 'SUV', power: '燃油', price: '63万 - 81万元', smartDrive: true, pros: '七座大空间quattro', cons: '第三排局促'),
    CarModel(name: 'Q4 e-tron', type: 'SUV', power: '纯电', price: '30万 - 38万元', smartDrive: true, pros: '纯电入门续航实在', cons: '快充速度一般'),
    CarModel(name: 'A3', type: '轿车', power: '燃油', price: '20万 - 25万元', smartDrive: false, pros: '年轻精致好停车', cons: '后排空间小'),
  ],
  'porsche': [
    CarModel(name: '911', type: '跑车', power: '燃油', price: '150万 - 300万元', smartDrive: true, pros: '跑车图腾操控极致', cons: '日常实用性低'),
    CarModel(name: 'Macan', type: 'SUV', power: '燃油', price: '58万 - 86万元', smartDrive: true, pros: '运动SUV标杆', cons: '选装贵上天'),
    CarModel(name: 'Cayenne', type: 'SUV', power: '燃油', price: '94万 - 250万元', smartDrive: true, pros: '全能豪华SUV', cons: '油耗保养双高'),
    CarModel(name: 'Taycan', type: '轿车', power: '纯电', price: '90万 - 180万元', smartDrive: true, pros: '电动跑车操控佳', cons: '续航一般'),
    CarModel(name: 'Panamera', type: '轿车', power: '燃油', price: '99万 - 250万元', smartDrive: true, pros: '四门跑车舒适运动', cons: '后备箱小'),
    CarModel(name: '718', type: '跑车', power: '燃油', price: '60万 - 100万元', smartDrive: false, pros: '中置后驱驾驶乐趣', cons: '储物空间极小'),
  ],
  'ferrari': [
    CarModel(name: 'Roma', type: '跑车', power: '燃油', price: '238万 - 260万元', smartDrive: true, pros: '优雅GT日常可开', cons: '维护成本极高'),
    CarModel(name: '296 GTB', type: '跑车', power: '混动', price: '298万 - 330万元', smartDrive: true, pros: 'V6混动性能炸裂', cons: '声浪不如V8'),
    CarModel(name: 'SF90', type: '跑车', power: '混动', price: '499万 - 550万元', smartDrive: true, pros: '千匹马力旗舰', cons: '价格高不可攀'),
    CarModel(name: 'Purosangue', type: 'SUV', power: '燃油', price: '499万 - 540万元', smartDrive: true, pros: '首款四门V12', cons: '油耗惊人'),
    CarModel(name: 'F8', type: '跑车', power: '燃油', price: '298万 - 330万元', smartDrive: true, pros: 'V8经典性能强悍', cons: '已停产需二手'),
  ],
  'lamborghini': [
    CarModel(name: 'Urus', type: 'SUV', power: '燃油', price: '294万 - 330万元', smartDrive: true, pros: '最速SUV之一', cons: '后排头部空间小'),
    CarModel(name: 'Huracan', type: '跑车', power: '燃油', price: '254万 - 390万元', smartDrive: true, pros: 'V10声浪迷人', cons: '视野差难日常'),
    CarModel(name: 'Revuelto', type: '跑车', power: '混动', price: '630万 - 700万元', smartDrive: true, pros: 'V12混动旗舰', cons: '订车等太久'),
    CarModel(name: 'Temerario', type: '跑车', power: '混动', price: '360万 - 400万元', smartDrive: true, pros: '全新V8混动', cons: '新车保值未知'),
  ],
  'rolls_royce': [
    CarModel(name: '幻影', type: '轿车', power: '燃油', price: '900万 - 1100万元', smartDrive: true, pros: '陆地头等舱极致奢华', cons: '价格天花板'),
    CarModel(name: '古思特', type: '轿车', power: '燃油', price: '490万 - 590万元', smartDrive: true, pros: '相对亲民的劳斯', cons: '依然高不可攀'),
    CarModel(name: '库里南', type: 'SUV', power: '燃油', price: '690万 - 800万元', smartDrive: true, pros: '最贵SUV气场无敌', cons: '越野能力象征性'),
    CarModel(name: '闪灵', type: '轿车', power: '纯电', price: '575万 - 650万元', smartDrive: true, pros: '首款纯电静谧奢华', cons: '续航仅400多公里'),
    CarModel(name: '魅影', type: '跑车', power: '燃油', price: '520万 - 600万元', smartDrive: true, pros: '双门优雅星空顶', cons: '实用性几乎为零'),
  ],
  'bentley': [
    CarModel(name: '欧陆GT', type: '跑车', power: '燃油', price: '330万 - 500万元', smartDrive: true, pros: '英伦GT典范', cons: '油耗保养昂贵'),
    CarModel(name: '飞驰', type: '轿车', power: '燃油', price: '290万 - 460万元', smartDrive: true, pros: '豪华轿车标杆之一', cons: '车重影响操控'),
    CarModel(name: '添越', type: 'SUV', power: '燃油', price: '270万 - 480万元', smartDrive: true, pros: '超豪华SUV开创者', cons: '保值率一般'),
    CarModel(name: '添越长轴距', type: 'SUV', power: '燃油', price: '330万 - 520万元', smartDrive: true, pros: '后排空间奢华', cons: '车身过长'),
    CarModel(name: 'Bentayga EWB', type: 'SUV', power: '混动', price: '310万 - 450万元', smartDrive: true, pros: '混动兼顾环保', cons: '纯电续航短'),
  ],
  'tesla': [
    CarModel(name: 'Model 3', type: '轿车', power: '纯电', price: '23万 - 34万元', smartDrive: true, pros: '电耗低智驾强', cons: '内饰简陋做工一般'),
    CarModel(name: 'Model Y', type: 'SUV', power: '纯电', price: '26万 - 36万元', smartDrive: true, pros: '全球销冠空间实用', cons: '悬挂偏硬'),
    CarModel(name: 'Model S', type: '轿车', power: '纯电', price: '80万 - 110万元', smartDrive: true, pros: '性能旗舰续航长', cons: '价格贵维修难'),
    CarModel(name: 'Model X', type: 'SUV', power: '纯电', price: '90万 - 120万元', smartDrive: true, pros: '鹰翼门科技感强', cons: '品控参差'),
    CarModel(name: 'Cybertruck', type: '皮卡', power: '纯电', price: '60万起（海外）', smartDrive: true, pros: '造型前卫话题王', cons: '国内未上市'),
  ],
  'byd': [
    CarModel(name: '秦PLUS', type: '轿车', power: '混动/纯电', price: '8万 - 18万元', smartDrive: true, pros: '省油省电销量王', cons: '内饰质感一般'),
    CarModel(name: '汉', type: '轿车', power: '混动/纯电', price: '17万 - 33万元', smartDrive: true, pros: '旗舰轿车配置高', cons: '底盘调校偏软'),
    CarModel(name: '唐', type: 'SUV', power: '混动/纯电', price: '18万 - 35万元', smartDrive: true, pros: '七座家用全能', cons: '第三排局促'),
    CarModel(name: '宋PLUS', type: 'SUV', power: '混动/纯电', price: '14万 - 22万元', smartDrive: true, pros: '均衡水桶车', cons: '外观中庸'),
    CarModel(name: '海豚', type: '轿车', power: '纯电', price: '10万 - 14万元', smartDrive: true, pros: '小车大空间', cons: '高速续航打折'),
    CarModel(name: '海豹', type: '轿车', power: '纯电', price: '15万 - 25万元', smartDrive: true, pros: '运动造型操控好', cons: '后排头部空间小'),
    CarModel(name: '仰望U8', type: 'SUV', power: '混动', price: '110万元', smartDrive: true, pros: '原地掉头黑科技', cons: '价格高小众'),
    CarModel(name: '方程豹豹5', type: 'SUV', power: '混动', price: '24万 - 33万元', smartDrive: true, pros: '硬派越野混动', cons: '城市油耗偏高'),
  ],
  'nio': [
    CarModel(name: 'ET5', type: '轿车', power: '纯电', price: '30万 - 40万元', smartDrive: true, pros: '换电方便智驾强', cons: '保值率一般'),
    CarModel(name: 'ET7', type: '轿车', power: '纯电', price: '45万 - 54万元', smartDrive: true, pros: '行政纯电舒适', cons: '价格偏高'),
    CarModel(name: 'ES6', type: 'SUV', power: '纯电', price: '34万 - 42万元', smartDrive: true, pros: '家用纯电均衡', cons: '电耗偏高'),
    CarModel(name: 'EC6', type: 'SUV', power: '纯电', price: '36万 - 44万元', smartDrive: true, pros: '轿跑SUV颜值高', cons: '后排头部局促'),
    CarModel(name: '乐道L60', type: 'SUV', power: '纯电', price: '21万 - 26万元', smartDrive: true, pros: '换电+低价走量', cons: '品牌认知待提升'),
    CarModel(name: '萤火虫', type: '轿车', power: '纯电', price: '12万 - 15万元', smartDrive: true, pros: '小车精品可爱', cons: '续航较短'),
  ],
  'xiaomi': [
    CarModel(name: 'SU7', type: '轿车', power: '纯电', price: '22万 - 30万元', smartDrive: true, pros: '颜值性能人车家', cons: '交付等待时间长'),
    CarModel(name: 'SU7 Ultra', type: '轿车', power: '纯电', price: '53万元', smartDrive: true, pros: '1500匹性能怪兽', cons: '价格翻倍'),
    CarModel(name: 'YU7', type: 'SUV', power: '纯电', price: '25万 - 33万元', smartDrive: true, pros: '对标Model Y订单爆', cons: '交付排到一年后'),
  ],
  'toyota': [
    CarModel(name: '卡罗拉', type: '轿车', power: '燃油/混动', price: '11万 - 16万元', smartDrive: false, pros: '省油耐用全球神车', cons: '内饰廉价'),
    CarModel(name: '凯美瑞', type: '轿车', power: '燃油/混动', price: '18万 - 27万元', smartDrive: true, pros: '混动省油舒适', cons: '动力佛系'),
    CarModel(name: 'RAV4荣放', type: 'SUV', power: '燃油/混动', price: '17万 - 26万元', smartDrive: true, pros: '均衡可靠保值', cons: '隔音一般'),
    CarModel(name: '汉兰达', type: 'SUV', power: '燃油/混动', price: '25万 - 35万元', smartDrive: true, pros: '大七座标杆', cons: '第三排一般'),
    CarModel(name: '陆放', type: 'SUV', power: '燃油/混动', price: '28万 - 36万元', smartDrive: true, pros: '硬派外观混动省油', cons: '加价提车'),
    CarModel(name: 'bZ4X', type: 'SUV', power: '纯电', price: '20万 - 28万元', smartDrive: true, pros: '丰田纯电首作', cons: '续航充电一般'),
    CarModel(name: '赛那', type: 'MPV', power: '混动', price: '31万 - 41万元', smartDrive: true, pros: '家用MPV省油', cons: '内饰塑料多'),
  ],
  'volvo': [
    CarModel(name: 'S60', type: '轿车', power: '燃油', price: '30万 - 39万元', smartDrive: true, pros: '安全环保北欧风', cons: '品牌溢价弱'),
    CarModel(name: 'S90', type: '轿车', power: '燃油', price: '41万 - 50万元', smartDrive: true, pros: '优惠大性价比高', cons: '保值率低'),
    CarModel(name: 'XC60', type: 'SUV', power: '燃油', price: '38万 - 47万元', smartDrive: true, pros: '安全标杆舒适', cons: '车机一般'),
    CarModel(name: 'XC90', type: 'SUV', power: '燃油/混动', price: '64万 - 89万元', smartDrive: true, pros: '北欧豪华七座', cons: '动力选择少'),
    CarModel(name: 'EX30', type: 'SUV', power: '纯电', price: '21万 - 26万元', smartDrive: true, pros: '小巧精致安全', cons: '空间小'),
    CarModel(name: 'EM90', type: 'MPV', power: '纯电', price: '82万 - 90万元', smartDrive: true, pros: '纯电豪华MPV', cons: '价格过高'),
  ],
  'hongqi': [
    CarModel(name: 'H5', type: '轿车', power: '燃油/混动', price: '16万 - 23万元', smartDrive: true, pros: '国宾气质性价比高', cons: '品牌溢价待提升'),
    CarModel(name: 'H9', type: '轿车', power: '燃油', price: '33万 - 54万元', smartDrive: true, pros: '国产豪华旗舰', cons: '油耗偏高'),
    CarModel(name: 'HS5', type: 'SUV', power: '燃油', price: '18万 - 25万元', smartDrive: true, pros: '空间大配置足', cons: '保值率一般'),
    CarModel(name: 'HS7', type: 'SUV', power: '燃油', price: '26万 - 36万元', smartDrive: true, pros: '中大型SUV气场', cons: '第三排局促'),
    CarModel(name: 'E-HS9', type: 'SUV', power: '纯电', price: '51万 - 78万元', smartDrive: true, pros: '纯电旗舰气场足', cons: '电耗续航一般'),
    CarModel(name: 'HQ9', type: 'MPV', power: '燃油/混动', price: '36万 - 54万元', smartDrive: true, pros: '商务MPV新贵', cons: '品牌认知待加强'),
    CarModel(name: '国雅', type: '轿车', power: '混动', price: '140万起', smartDrive: true, pros: '国宾级超豪华', cons: '天价小众'),
  ],
  'lexus': [
    CarModel(name: 'ES', type: '轿车', power: '燃油/混动', price: '30万 - 49万元', smartDrive: true, pros: '舒适静谧混动省油', cons: '动力佛系'),
    CarModel(name: 'RX', type: 'SUV', power: '燃油/混动', price: '41万 - 62万元', smartDrive: true, pros: '豪华舒适做工精', cons: '加价提车'),
    CarModel(name: 'NX', type: 'SUV', power: '燃油/混动', price: '32万 - 46万元', smartDrive: true, pros: '精致紧凑SUV', cons: '后排空间一般'),
    CarModel(name: 'LS', type: '轿车', power: '燃油/混动', price: '88万 - 120万元', smartDrive: true, pros: '东方豪华极致', cons: '品牌力弱于BBA'),
    CarModel(name: 'LM', type: 'MPV', power: '混动', price: '120万 - 150万元', smartDrive: true, pros: '保姆车天花板', cons: '加价严重'),
    CarModel(name: 'UX', type: 'SUV', power: '混动', price: '27万 - 33万元', smartDrive: false, pros: '入门雷克萨斯', cons: '空间小'),
  ],
  'li_auto': [
    CarModel(name: 'L6', type: 'SUV', power: '增程', price: '25万 - 29万元', smartDrive: true, pros: '家用奶爸车销冠', cons: '增程高速油耗高'),
    CarModel(name: 'L7', type: 'SUV', power: '增程', price: '30万 - 36万元', smartDrive: true, pros: '大五座舒适', cons: '第三排无'),
    CarModel(name: 'L8', type: 'SUV', power: '增程', price: '33万 - 40万元', smartDrive: true, pros: '六座旗舰家庭', cons: '价格偏高'),
    CarModel(name: 'L9', type: 'SUV', power: '增程', price: '43万 - 46万元', smartDrive: true, pros: '全尺寸旗舰', cons: '车身大难停车'),
    CarModel(name: 'MEGA', type: 'MPV', power: '纯电', price: '53万元', smartDrive: true, pros: '纯电MPV续航长', cons: '造型争议大'),
    CarModel(name: 'i8', type: 'SUV', power: '纯电', price: '32万 - 38万元', smartDrive: true, pros: '纯电SUV新作', cons: '品牌纯电待验证'),
  ],
  'maserati': [
    CarModel(name: 'Ghibli', type: '轿车', power: '燃油', price: '88万 - 120万元', smartDrive: true, pros: '意式优雅声浪迷人', cons: '保值率惨淡'),
    CarModel(name: 'Levante', type: 'SUV', power: '燃油', price: '96万 - 190万元', smartDrive: true, pros: '运动SUV先驱', cons: '内饰老气'),
    CarModel(name: 'MC20', type: '跑车', power: '燃油', price: '270万 - 320万元', smartDrive: true, pros: '海神超跑性能强', cons: '极小众'),
    CarModel(name: 'GranTurismo', type: '跑车', power: '燃油/纯电', price: '190万 - 280万元', smartDrive: true, pros: 'GT跑车优雅', cons: '维护贵'),
    CarModel(name: 'Grecale', type: 'SUV', power: '燃油', price: '66万 - 100万元', smartDrive: true, pros: '入门门槛降低', cons: '品牌认知弱'),
  ],
  'geely': [
    CarModel(name: '星越L', type: 'SUV', power: '燃油', price: '14万 - 18万元', smartDrive: true, pros: '三大件扎实空间大', cons: '油耗偏高'),
    CarModel(name: '星瑞', type: '轿车', power: '燃油', price: '11万 - 15万元', smartDrive: true, pros: '2.0T动力越级', cons: '后排地台凸起'),
    CarModel(name: '星愿', type: '轿车', power: '纯电', price: '7万 - 10万元', smartDrive: true, pros: '精品小车智驾强', cons: '品牌溢价弱'),
    CarModel(name: '银河E5', type: 'SUV', power: '纯电', price: '10万 - 14万元', smartDrive: true, pros: '后驱+激光雷达', cons: '交付爬坡中'),
    CarModel(name: '银河星舰7', type: 'SUV', power: '混动', price: '10万 - 14万元', smartDrive: true, pros: '混动省油空间大', cons: '新车待验证'),
    CarModel(name: '博越', type: 'SUV', power: '燃油', price: '10万 - 15万元', smartDrive: false, pros: '经典SUV皮实', cons: '内饰偏旧'),
    CarModel(name: '极氪001', type: '轿车', power: '纯电', price: '27万 - 33万元', smartDrive: true, pros: '猎装轿跑操控好', cons: '早期品控问题'),
    CarModel(name: '领克08', type: 'SUV', power: '混动', price: '19万 - 29万元', smartDrive: true, pros: '潮流设计混动强', cons: '价格偏高'),
  ],
  'greatwall': [
    CarModel(name: '哈弗H6', type: 'SUV', power: '燃油', price: '10万 - 15万元', smartDrive: false, pros: '国民神车保有量大', cons: '换代后竞争力降'),
    CarModel(name: '坦克300', type: 'SUV', power: '燃油/混动', price: '20万 - 33万元', smartDrive: true, pros: '硬派越野网红', cons: '油耗高'),
    CarModel(name: '坦克500', type: 'SUV', power: '燃油/混动', price: '34万 - 40万元', smartDrive: true, pros: '大排量硬派豪华', cons: '车重大油耗高'),
    CarModel(name: '魏牌蓝山', type: 'SUV', power: '混动', price: '30万 - 33万元', smartDrive: true, pros: '智能座舱豪华', cons: '品牌认知弱'),
    CarModel(name: '哈弗猛龙', type: 'SUV', power: '混动', price: '17万 - 20万元', smartDrive: true, pros: '方盒子混动省油', cons: '越野能力一般'),
    CarModel(name: '欧拉好猫', type: '轿车', power: '纯电', price: '13万 - 17万元', smartDrive: true, pros: '复古可爱女性向', cons: '空间小'),
    CarModel(name: '长城炮', type: '皮卡', power: '燃油', price: '10万 - 18万元', smartDrive: false, pros: '皮卡销冠实用', cons: '市区限行'),
  ],
  'chery': [
    CarModel(name: '瑞虎8', type: 'SUV', power: '燃油', price: '10万 - 15万元', smartDrive: true, pros: '冠军家族空间大', cons: '内饰质感一般'),
    CarModel(name: '艾瑞泽8', type: '轿车', power: '燃油', price: '11万 - 15万元', smartDrive: true, pros: '2.0T性能强', cons: '油耗偏高'),
    CarModel(name: '瑞虎9', type: 'SUV', power: '燃油', price: '15万 - 21万元', smartDrive: true, pros: '旗舰SUV配置高', cons: '品牌溢价弱'),
    CarModel(name: '风云T9', type: 'SUV', power: '混动', price: '13万 - 19万元', smartDrive: true, pros: '混动省油续航长', cons: '新车待验证'),
    CarModel(name: '探索06', type: 'SUV', power: '燃油/混动', price: '12万 - 16万元', smartDrive: true, pros: '轻越野风格', cons: '动力一般'),
    CarModel(name: '星纪元ES', type: '轿车', power: '纯电', price: '20万 - 34万元', smartDrive: true, pros: '高端纯电轿跑', cons: '品牌认知待提升'),
    CarModel(name: 'iCAR V23', type: 'SUV', power: '纯电', price: '11万 - 15万元', smartDrive: true, pros: '方盒子纯电个性', cons: '续航一般'),
  ],
};

// ================= 页面 =================

class _CarBrandToolPageState extends State<CarBrandToolPage> {
  String _query = '';
  String _category = '全部';

  List<CarBrand> get _filtered => kCarBrands.where((b) {
        final okCat = _category == '全部' || b.category == _category;
        final q = _query.trim();
        final okSearch = q.isEmpty ||
            b.nameZh.contains(q) ||
            b.nameEn.toLowerCase().contains(q.toLowerCase()) ||
            b.country.contains(q);
        return okCat && okSearch;
      }).toList();

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);

    return SubPage(
      title: CarBrandToolPage.pageTitle,
      child: SafeArea(
        child: TopFadeListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0xFFDC2626),
                              Color(0xFFF97316)
                            ]),
                          ),
                          alignment: Alignment.center,
                          child: const Icon(Icons.directions_car,
                              color: Colors.white, size: 26),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('车标大全',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: pal.foreground)),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text('真实车标库 · 品牌档案 · 主力车型',
                                    style: TextStyle(
                                        fontSize: 11.5,
                                        color: pal.secondary)),
                              ),
                            ],
                          ),
                        ),
                        Text('${kCarBrands.length} 品牌',
                            style: TextStyle(
                                fontSize: 11, color: pal.secondary)),
                      ],
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      onChanged: (v) => setState(() => _query = v),
                      decoration: InputDecoration(
                        hintText: '搜索车标/品牌名，如：大众、宝马、迈巴赫…',
                        hintStyle: const TextStyle(fontSize: 12),
                        prefixIcon: Icon(Icons.search,
                            color: pal.secondary, size: 18),
                        suffixIcon: _query.isNotEmpty
                            ? IconButton(
                                onPressed: () =>
                                    setState(() => _query = ''),
                                icon: Icon(Icons.close,
                                    color: pal.secondary, size: 16),
                              )
                            : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: kCarCategories.map((cat) {
                  final sel = _category == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => setState(() => _category = cat),
                      child: Container(
                        decoration: BoxDecoration(
                          color: sel ? pal.accent : pal.subtleFill,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        child: Text(cat,
                            style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                                color: sel
                                    ? Colors.white
                                    : pal.foreground)),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            if (_filtered.isEmpty)
              GlassPanel(
                isDark: isDark,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: Center(
                    child: Text('没有匹配的品牌，换个关键词试试',
                        style:
                            TextStyle(fontSize: 12, color: pal.secondary)),
                  ),
                ),
              )
            else
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.82,
                children: _filtered
                    .map((b) => _brandCard(pal, isDark, b))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _brandCard(Palette pal, bool isDark, CarBrand b) {
    return GestureDetector(
      onTap: () => _openDetail(pal, isDark, b),
      child: GlassPanel(
        isDark: isDark,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _logoImage(b, 72),
              const SizedBox(height: 10),
              Text(b.nameZh,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: pal.foreground)),
              Text(b.nameEn,
                  style:
                      TextStyle(fontSize: 10, color: pal.secondary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  color: pal.subtleFill,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Text('${b.country} · ${b.category}',
                    style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: pal.secondary)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 车标图片（assets 本地 png），加载失败时用品牌首字兜底
  Widget _logoImage(CarBrand b, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFFF1F5F9),
        border: Border.all(color: const Color(0xFFCBD5E1), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        b.logoAsset,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => Center(
          child: Text(
            b.nameZh.isNotEmpty ? b.nameZh[0] : '🚗',
            style: const TextStyle(fontSize: 28, color: Color(0xFF64748B)),
          ),
        ),
      ),
    );
  }

  void _openDetail(Palette pal, bool isDark, CarBrand b) {
    final models = kCarModels[b.id] ?? const <CarModel>[];
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 620),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('🚘 品牌档案详情',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: pal.foreground)),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      icon: Icon(Icons.close, color: pal.secondary),
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _logoImage(b, 96),
                const SizedBox(height: 12),
                Text(b.nameZh,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: pal.foreground)),
                Text(b.nameEn,
                    style:
                        TextStyle(fontSize: 12, color: pal.secondary)),
                const SizedBox(height: 14),
                Container(
                  decoration: BoxDecoration(
                    color: pal.subtleFill,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      _detailRow(pal, '国别地区', b.country),
                      _detailRow(pal, '创立年份', b.foundingYear),
                      _detailRow(pal, '品牌总部', b.headquarters),
                      _detailRow(pal, '指导价位', b.priceRange),
                      _detailRow(pal, '经典标语', b.slogan),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF7ED),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('📖 车标设计含义与内涵',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFC2410C))),
                      const SizedBox(height: 4),
                      Text(b.logoDescription,
                          style: const TextStyle(
                              fontSize: 11.5,
                              height: 1.5,
                              color: Color(0xFF7C2D12))),
                    ],
                  ),
                ),
                if (models.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0FDF4),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('🚗 旗下主力车型（${models.length} 款）',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF166534))),
                        const SizedBox(height: 8),
                        ...models.map((m) => _modelRow(m)),
                        const SizedBox(height: 4),
                        const Text(
                            '💡 带「智能驾驶」标签的车型支持 L2 级辅助驾驶（含自动避障/主动刹车）',
                            style: TextStyle(
                                fontSize: 10.5,
                                height: 1.4,
                                color: Color(0xFF65A30D))),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: pal.accent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('好的，了解了',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailRow(Palette pal, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 64,
            child: Text(label,
                style: TextStyle(fontSize: 11.5, color: pal.secondary)),
          ),
          Expanded(
            child: Text(value,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w500,
                    color: pal.foreground)),
          ),
        ],
      ),
    );
  }

  Widget _modelRow(CarModel m) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(m.name,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF14532D))),
              ),
              if (m.smartDrive)
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF16A34A),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  child: const Text('智能驾驶',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
            ],
          ),
          Text('${m.type} · ${m.power} · ${m.price}',
              style:
                  const TextStyle(fontSize: 11, color: Color(0xFF4D7C0F))),
          Text('✅ ${m.pros}',
              style: const TextStyle(
                  fontSize: 11, height: 1.4, color: Color(0xFF365314))),
          Text('⚠️ ${m.cons}',
              style: const TextStyle(
                  fontSize: 11, height: 1.4, color: Color(0xFF92400E))),
          const Divider(color: Color(0xFFBBF7D0), height: 12),
        ],
      ),
    );
  }
}
