import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';
import 'package:jicun/lzdz/toast.dart';

class EmergencyNumber {
  final String name;
  final String number;
  final String desc;
  const EmergencyNumber({required this.name, required this.number, this.desc = ''});
}

class EmergencyCategory {
  final String id;
  final String title;
  final String icon;
  final List<EmergencyNumber> numbers;
  const EmergencyCategory({required this.id, required this.title, required this.icon, required this.numbers});
}

const List<EmergencyCategory> kEmergencyCategories = <EmergencyCategory>[
  EmergencyCategory(
    id: 'rescue',
    title: '急救救援',
    icon: '🚑',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '公安报警',
        number: '110',
        desc: '刑事案件、治安报警、危急人身安全',
      ),
      EmergencyNumber(
        name: '火警救援',
        number: '119',
        desc: '火灾扑救、抢险救援、社会救助',
      ),
      EmergencyNumber(
        name: '医疗急救',
        number: '120',
        desc: '院前急危重症医疗救护',
      ),
      EmergencyNumber(
        name: '交通事故报警',
        number: '122',
        desc: '道路交通事故报警与拥堵求助',
      ),
      EmergencyNumber(
        name: '红十字急救',
        number: '999',
        desc: '北京等地区红十字会医疗急救中心',
      ),
      EmergencyNumber(
        name: '水上搜救遇险',
        number: '12395',
        desc: '中国海上/水上搜救中心遇险求救',
      ),
      EmergencyNumber(
        name: '森林草原火警',
        number: '12119',
        desc: '全国森林草原火灾报警热线',
      ),
      EmergencyNumber(
        name: '短信报警',
        number: '12110',
        desc: '听力语言障碍或不便语音通话时短信报警',
      ),
      EmergencyNumber(
        name: '国际通用求救',
        number: '112',
        desc: '无卡/弱信号紧急呼叫自动转接救援',
      ),
      EmergencyNumber(
        name: '安全生产举报',
        number: '12350',
        desc: '应急管理部安全生产事故与隐患举报',
      ),
      EmergencyNumber(
        name: '国家安全举报',
        number: '12339',
        desc: '国家安全机关危害国家安全线索举报',
      ),
      EmergencyNumber(
        name: '火灾隐患举报',
        number: '96119',
        desc: '消防安全违法行为与火灾隐患举报',
      ),
      EmergencyNumber(
        name: '地震公益热线',
        number: '12322',
        desc: '防震减灾科普与地震速报咨询',
      ),
      EmergencyNumber(
        name: '蓝天救援队',
        number: '400-600-9958',
        desc: '民间专业公益紧急救援服务热线',
      ),
      EmergencyNumber(
        name: '外交部领事保护',
        number: '12308',
        desc: '海外中国公民24小时全球领事保护应急热线',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'traffic',
    title: '交通出行',
    icon: '🚗',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '交通运输监督',
        number: '12328',
        desc: '全国公路/水路/道路运输服务监督与救援',
      ),
      EmergencyNumber(
        name: '全国高速救援',
        number: '12122',
        desc: '全国高速公路交通事故报警与拖车救援',
      ),
      EmergencyNumber(
        name: '铁路客服中心',
        number: '12306',
        desc: '全国火车票务改签、遗失物品查找、重点旅客预约',
      ),
      EmergencyNumber(
        name: '民航服务监督',
        number: '12326',
        desc: '民航局航班延误维权与服务质量监督投诉',
      ),
      EmergencyNumber(
        name: '全国出租约车',
        number: '95128',
        desc: '全国统一巡游出租汽车电召约车服务',
      ),
      EmergencyNumber(
        name: '邮政业申诉',
        number: '12305',
        desc: '国家邮政局快递物流延误丢失官方申诉',
      ),
      EmergencyNumber(
        name: '天气预报查询',
        number: '12121',
        desc: '全国实时气象预警与出行天气查询',
      ),
      EmergencyNumber(
        name: '中国国际航空',
        number: '95583',
        desc: '国航机票退改签与行李服务客服',
      ),
      EmergencyNumber(
        name: '中国南方航空',
        number: '95539',
        desc: '南航机票退改签与航班动态客服',
      ),
      EmergencyNumber(
        name: '中国东方航空',
        number: '95530',
        desc: '东航机票退改签与乘机服务客服',
      ),
      EmergencyNumber(
        name: '海南航空客服',
        number: '95339',
        desc: '海航机票票务与旅客服务热线',
      ),
      EmergencyNumber(
        name: '厦门航空客服',
        number: '95557',
        desc: '厦航机票票务与乘机服务热线',
      ),
      EmergencyNumber(
        name: '深圳航空客服',
        number: '95361',
        desc: '深航机票票务与乘机服务热线',
      ),
      EmergencyNumber(
        name: '四川航空客服',
        number: '95378',
        desc: '川航机票票务与乘机服务热线',
      ),
      EmergencyNumber(
        name: '山东航空客服',
        number: '95369',
        desc: '山航机票票务与乘机服务热线',
      ),
      EmergencyNumber(
        name: '春秋航空客服',
        number: '95524',
        desc: '春秋航空票务与行李托运客服',
      ),
      EmergencyNumber(
        name: '吉祥航空客服',
        number: '95520',
        desc: '吉祥航空票务与航班服务热线',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'gov',
    title: '政务服务',
    icon: '🏛️',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '政务便民热线',
        number: '12345',
        desc: '全国统一政府公共服务与市民诉求热线',
      ),
      EmergencyNumber(
        name: '公共法律服务',
        number: '12348',
        desc: '司法部免费法律咨询与法律援助申请',
      ),
      EmergencyNumber(
        name: '法院诉讼服务',
        number: '12368',
        desc: '最高法及全国法院立案查询与诉讼服务',
      ),
      EmergencyNumber(
        name: '检察服务热线',
        number: '12309',
        desc: '全国检察机关控告申诉与检务公开服务',
      ),
      EmergencyNumber(
        name: '纳税缴费服务',
        number: '12366',
        desc: '国家税务总局个税申报、发票与税务咨询',
      ),
      EmergencyNumber(
        name: '海关业务咨询',
        number: '12360',
        desc: '海关总署进出口通关与行邮税咨询',
      ),
      EmergencyNumber(
        name: '市场监管维权',
        number: '12315',
        desc: '全国市场监督管理总局假冒伪劣与消费维权',
      ),
      EmergencyNumber(
        name: '移民管理出入境',
        number: '12367',
        desc: '国家移民管理局护照签证与出入境政务咨询',
      ),
      EmergencyNumber(
        name: '自然资源举报',
        number: '12336',
        desc: '违法占地、乱占耕地与矿产资源违法举报',
      ),
      EmergencyNumber(
        name: '信访服务热线',
        number: '12370',
        desc: '公务员管理与政务信访咨询服务',
      ),
      EmergencyNumber(
        name: '知识产权维权',
        number: '12330',
        desc: '全国知识产权侵权举报与维权援助',
      ),
      EmergencyNumber(
        name: '文化旅游服务',
        number: '12301',
        desc: '全国旅游景区投诉与文化旅游咨询',
      ),
      EmergencyNumber(
        name: '广电服务热线',
        number: '12355',
        desc: '广播电视与公共文化服务咨询',
      ),
      EmergencyNumber(
        name: '公安违纪举报',
        number: '12389',
        desc: '公安部及各级公安机关民警违法违纪举报',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'social',
    title: '社会保障',
    icon: '🏥',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '人社社保热线',
        number: '12333',
        desc: '养老保险、失业保险、社保卡与职称考试咨询',
      ),
      EmergencyNumber(
        name: '医保服务热线',
        number: '12393',
        desc: '全国医疗保险报销、异地就医备案专用热线',
      ),
      EmergencyNumber(
        name: '住房公积金',
        number: '12329',
        desc: '全国住房公积金提取、贷款与账户查询',
      ),
      EmergencyNumber(
        name: '卫生健康热线',
        number: '12320',
        desc: '公共卫生、疫苗接种、寻医问药与戒烟咨询',
      ),
      EmergencyNumber(
        name: '民政服务热线',
        number: '12349',
        desc: '社会救助、居家养老与婚姻殡葬民政咨询',
      ),
      EmergencyNumber(
        name: '残疾人服务',
        number: '12385',
        desc: '中国残联康复救助、补贴申请与维权服务',
      ),
      EmergencyNumber(
        name: '妇女儿童维权',
        number: '12338',
        desc: '全国妇联反家暴、婚姻家庭与妇女儿童维权',
      ),
      EmergencyNumber(
        name: '青少年心理援助',
        number: '12355',
        desc: '共青团青少年心理疏导与法律维权热线',
      ),
      EmergencyNumber(
        name: '红十字会服务',
        number: '999',
        desc: '人道救助、应急救护培训与遗体器官捐献咨询',
      ),
      EmergencyNumber(
        name: '全国心理危机干预',
        number: '400-161-9995',
        desc: '24小时希望24热线生命教育与心理危机干预',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'labor',
    title: '劳动劳务',
    icon: '🧑‍🏭',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '劳动保障监察',
        number: '12333',
        desc: '用人单位恶意欠薪、违法裁员、不缴社保举报',
      ),
      EmergencyNumber(
        name: '全国总工会维权',
        number: '12351',
        desc: '全国总工会职工法律维权、困难帮扶与劳动保护',
      ),
      EmergencyNumber(
        name: '劳动法律援助',
        number: '12348',
        desc: '工伤认定、劳动仲裁申请书撰写与免费律师援助',
      ),
      EmergencyNumber(
        name: '建筑欠薪投诉',
        number: '12319',
        desc: '住建部门工程建设领域农民工工资拖欠投诉',
      ),
      EmergencyNumber(
        name: '安全生产隐患',
        number: '12350',
        desc: '工作场所强令违章冒险作业、职业危害举报',
      ),
      EmergencyNumber(
        name: '法院执行线索',
        number: '12368',
        desc: '欠薪案件胜诉后申请法院强制执行与查封财产',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'complaint',
    title: '投诉举报',
    icon: '📢',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '全国反诈专线',
        number: '96110',
        desc: '国家反诈中心劝阻预警、疑似电信网络诈骗报警',
      ),
      EmergencyNumber(
        name: '工信部反诈预警',
        number: '12381',
        desc: '涉诈短信/电话预警与个人信息防诈提醒',
      ),
      EmergencyNumber(
        name: '消费维权举报',
        number: '12315',
        desc: '网购退换货纠纷、霸王条款、虚假宣传投诉',
      ),
      EmergencyNumber(
        name: '纪检监察举报',
        number: '12388',
        desc: '中央纪委国家监委公职人员贪污受贿违纪举报',
      ),
      EmergencyNumber(
        name: '检察院控告申诉',
        number: '12309',
        desc: '司法不公控告、刑事申诉与公益诉讼线索举报',
      ),
      EmergencyNumber(
        name: '生态环境举报',
        number: '12369',
        desc: '水污染、大气污染、夜间施工噪音扰民环保举报',
      ),
      EmergencyNumber(
        name: '互联网违法举报',
        number: '12377',
        desc: '中央网信办网络谣言、暴力色情、网暴侵权举报',
      ),
      EmergencyNumber(
        name: '垃圾骚扰举报',
        number: '12321',
        desc: '网络不良与垃圾短信、骚扰电话、钓鱼网站举报',
      ),
      EmergencyNumber(
        name: '扫黄打非举报',
        number: '12390',
        desc: '全国扫黄打非办非法出版物与涉黄涉非举报',
      ),
      EmergencyNumber(
        name: '文化市场举报',
        number: '12318',
        desc: '网吧违规接纳未成年人、演出及娱乐场所违法举报',
      ),
      EmergencyNumber(
        name: '粮食监管举报',
        number: '12325',
        desc: '全国粮食流通监管与涉粮违法违规行为举报',
      ),
      EmergencyNumber(
        name: '农业农村举报',
        number: '12316',
        desc: '假劣农资种子化肥农药坑农害农投诉与三农服务',
      ),
      EmergencyNumber(
        name: '能源监管热线',
        number: '12398',
        desc: '国家能源局电力供电垄断、违规收费投诉举报',
      ),
      EmergencyNumber(
        name: '证券期货维权',
        number: '12386',
        desc: '中国证监会投资者保护、非法证券基金举报',
      ),
      EmergencyNumber(
        name: '银行保险投诉',
        number: '12378',
        desc: '国家金融监管总局银行乱收费、暴力催收、理赔难投诉',
      ),
      EmergencyNumber(
        name: '组织部干部监督',
        number: '12380',
        desc: '违规选人用人、跑官要官拉票贿选举报热线',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'bank',
    title: '银行客服',
    icon: '🏦',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '工商银行',
        number: '95588',
        desc: '工行信用卡/储蓄卡挂失、转账限额与人工客服',
      ),
      EmergencyNumber(
        name: '农业银行',
        number: '95599',
        desc: '农行银行卡挂失、贷款账单与24小时人工服务',
      ),
      EmergencyNumber(
        name: '中国银行',
        number: '95566',
        desc: '中行外汇结售汇、银行卡挂失与综合客服',
      ),
      EmergencyNumber(
        name: '建设银行',
        number: '95533',
        desc: '建行房贷公积金、龙卡信用卡与储蓄挂失客服',
      ),
      EmergencyNumber(
        name: '交通银行',
        number: '95559',
        desc: '交行储蓄卡/买单吧信用卡挂失与人工服务',
      ),
      EmergencyNumber(
        name: '邮储银行',
        number: '95580',
        desc: '中国邮政储蓄银行账户挂失与金融服务热线',
      ),
      EmergencyNumber(
        name: '招商银行',
        number: '95555',
        desc: '招行一卡通储蓄客服（信用卡专线 400-820-5555）',
      ),
      EmergencyNumber(
        name: '中信银行',
        number: '95558',
        desc: '中信储蓄卡与信用卡综合金融客服热线',
      ),
      EmergencyNumber(
        name: '民生银行',
        number: '95568',
        desc: '中国民生银行7×24小时挂失与客户服务',
      ),
      EmergencyNumber(
        name: '兴业银行',
        number: '95561',
        desc: '兴业银行信用卡/借记卡紧急冻结与客服',
      ),
      EmergencyNumber(
        name: '光大银行',
        number: '95595',
        desc: '中国光大银行阳光卡挂失与客户服务热线',
      ),
      EmergencyNumber(
        name: '华夏银行',
        number: '95577',
        desc: '华夏银行个人储蓄与信用卡24小时客服',
      ),
      EmergencyNumber(
        name: '浦发银行',
        number: '95528',
        desc: '上海浦东发展银行借记卡与金融咨询热线',
      ),
      EmergencyNumber(
        name: '广发银行',
        number: '95508',
        desc: '广发银行信用卡/储蓄卡官方客户服务热线',
      ),
      EmergencyNumber(
        name: '平安银行',
        number: '95511',
        desc: '平安银行储蓄及信用卡综合服务（转3）',
      ),
      EmergencyNumber(
        name: '中国银联',
        number: '95516',
        desc: '云闪付、跨行交易差错查询与银联卡境外紧急救援',
      ),
      EmergencyNumber(
        name: '中国人民银行',
        number: '12363',
        desc: '央行个人征信异议申诉、拒收人民币现金投诉',
      ),
      EmergencyNumber(
        name: '北京银行',
        number: '95526',
        desc: '北京银行24小时客户服务与紧急挂失',
      ),
      EmergencyNumber(
        name: '上海银行',
        number: '95594',
        desc: '上海银行24小时客户服务与紧急挂失',
      ),
      EmergencyNumber(
        name: '江苏银行',
        number: '95319',
        desc: '江苏银行24小时综合金融客服热线',
      ),
      EmergencyNumber(
        name: '浙商银行',
        number: '95527',
        desc: '浙商银行全国统一客户服务热线',
      ),
      EmergencyNumber(
        name: '渤海银行',
        number: '95541',
        desc: '渤海银行全国统一客户服务热线',
      ),
      EmergencyNumber(
        name: '微众银行',
        number: '95384',
        desc: '微粒贷与微众银行官方客户服务热线',
      ),
      EmergencyNumber(
        name: '网商银行',
        number: '95188-3',
        desc: '支付宝网商银行贷款与理财客服热线',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'express',
    title: '快递物流',
    icon: '📦',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '邮政总局申诉',
        number: '12305',
        desc: '快递丢失不赔、暴力分拣向国家邮政局官方投诉',
      ),
      EmergencyNumber(
        name: '顺丰速运',
        number: '95338',
        desc: '顺丰寄件下单、快件催派与理赔客服',
      ),
      EmergencyNumber(
        name: '京东物流',
        number: '950616',
        desc: '京东快递上门揽收、冷链大件与理赔客服',
      ),
      EmergencyNumber(
        name: '中国邮政EMS',
        number: '11183',
        desc: 'EMS全球邮政特快专递、高考录取通知书查询',
      ),
      EmergencyNumber(
        name: '中国邮政普邮',
        number: '11185',
        desc: '邮政平邮包裹、报刊订阅与邮政普遍服务',
      ),
      EmergencyNumber(
        name: '中通快递',
        number: '95311',
        desc: '中通快件查询、网点投诉与上门取件',
      ),
      EmergencyNumber(
        name: '圆通速递',
        number: '95554',
        desc: '圆通快件催件、破损丢件理赔客服',
      ),
      EmergencyNumber(
        name: '申通快递',
        number: '95543',
        desc: '申通快件物流跟踪与异常处理客服',
      ),
      EmergencyNumber(
        name: '韵达快递',
        number: '95546',
        desc: '韵达快件派送异常与网点服务监督',
      ),
      EmergencyNumber(
        name: '极兔速递',
        number: '956025',
        desc: '极兔速递查件寄件与官方售后投诉',
      ),
      EmergencyNumber(
        name: '菜鸟裹裹',
        number: '400-178-7878',
        desc: '菜鸟驿站代收投诉、上门取件与丢件赔付',
      ),
      EmergencyNumber(
        name: '德邦快递',
        number: '95353',
        desc: '德邦大件物流、搬家托运与售后理赔',
      ),
      EmergencyNumber(
        name: '跨越速运',
        number: '95324',
        desc: '跨越限时航空件与企业物流24小时客服',
      ),
      EmergencyNumber(
        name: '安能物流',
        number: '95344',
        desc: '安能零担快运大件物流查件与客服',
      ),
      EmergencyNumber(
        name: '百世快运',
        number: '95320',
        desc: '百世大件快运物流查询与售后客服',
      ),
      EmergencyNumber(
        name: '闪送同城',
        number: '400-612-6688',
        desc: '闪送同城一对一急件专送客服热线',
      ),
      EmergencyNumber(
        name: '顺丰同城急送',
        number: '95338-68',
        desc: '顺丰同城即时配送小时达客服热线',
      ),
      EmergencyNumber(
        name: '货拉拉客服',
        number: '10103636',
        desc: '货拉拉货运搬家订单纠纷与安全专线',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'ecommerce',
    title: '电商平台',
    icon: '🛒',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '淘宝消费者热线',
        number: '9510211',
        desc: '淘宝网购纠纷、假货维权与极速退款人工客服',
      ),
      EmergencyNumber(
        name: '天猫官方客服',
        number: '400-860-8608',
        desc: '天猫商城正品保障与售后维权专线',
      ),
      EmergencyNumber(
        name: '京东商城客服',
        number: '950618',
        desc: '京东自营售后退换、价保与专属客服',
      ),
      EmergencyNumber(
        name: '拼多多消费者热线',
        number: '021-53395288',
        desc: '拼多多仅退款争议、百亿补贴正品维权客服',
      ),
      EmergencyNumber(
        name: '抖音电商客服',
        number: '95152',
        desc: '抖音直播带货退换货、账号安全与官方维权',
      ),
      EmergencyNumber(
        name: '快手电商客服',
        number: '400-006-6666',
        desc: '快手小店商品售后与消费者保障热线',
      ),
      EmergencyNumber(
        name: '微信支付客服',
        number: '95017',
        desc: '微信转账被骗紧急冻结、零钱提现与账单客服',
      ),
      EmergencyNumber(
        name: '支付宝客服',
        number: '95188',
        desc: '支付宝账户被盗险理赔、花呗借呗与交易申诉',
      ),
      EmergencyNumber(
        name: '唯品会客服',
        number: '400-6789-888',
        desc: '唯品会品牌特卖退换货与售后客服',
      ),
      EmergencyNumber(
        name: '得物App客服',
        number: '400-101-3535',
        desc: '得物潮流鉴别争议与买家售后热线',
      ),
      EmergencyNumber(
        name: '小红书客服',
        number: '400-602-9988',
        desc: '小红书商城订单售后与社区举报热线',
      ),
      EmergencyNumber(
        name: '闲鱼二手客服',
        number: '9510222',
        desc: '闲鱼二手交易欺诈举报与小法庭争议处理',
      ),
      EmergencyNumber(
        name: '苏宁易购客服',
        number: '400-836-5365',
        desc: '苏宁家电售后安装维修与商城客服',
      ),
      EmergencyNumber(
        name: '小米官方商城',
        number: '400-100-5678',
        desc: '小米手机数码全国联保售后与商城客服',
      ),
      EmergencyNumber(
        name: '华为消费者热线',
        number: '950800',
        desc: '华为商城订单、手机鸿蒙售后维修官方热线',
      ),
      EmergencyNumber(
        name: 'Apple苹果官方',
        number: '400-666-8800',
        desc: 'Apple Store订单退换与iPhone/Mac技术支持',
      ),
      EmergencyNumber(
        name: '美团综合客服',
        number: '10107888',
        desc: '美团团购券退款、到店餐饮与综合投诉',
      ),
      EmergencyNumber(
        name: '滴滴出行客服',
        number: '400-000-0999',
        desc: '滴滴网约车物品遗失、绕路多收费投诉与紧急求助',
      ),
      EmergencyNumber(
        name: '携程旅行客服',
        number: '95010',
        desc: '携程机票酒店退改、旅游度假违约维权热线',
      ),
      EmergencyNumber(
        name: '飞猪旅行客服',
        number: '9510208',
        desc: '飞猪机票酒店火车票退改签与保障客服',
      ),
      EmergencyNumber(
        name: '去哪儿网客服',
        number: '95117',
        desc: '去哪儿网机票酒店预订售后与投诉热线',
      ),
      EmergencyNumber(
        name: '同程旅行客服',
        number: '95711',
        desc: '同程旅行机票火车票酒店预订客户服务',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'delivery',
    title: '外卖订餐',
    icon: '🍜',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '美团外卖',
        number: '10109777',
        desc: '美团外卖超时赔付、餐品洒漏异物维权热线',
      ),
      EmergencyNumber(
        name: '饿了么外卖',
        number: '10105757',
        desc: '饿了么外卖催单、退单理赔与食品安全投诉',
      ),
      EmergencyNumber(
        name: '食品安全举报',
        number: '12315',
        desc: '外卖吃出异物、变质过期向市场监管局索赔举报',
      ),
      EmergencyNumber(
        name: '肯德基宅急送',
        number: '400-882-3823',
        desc: 'KFC肯德基宅急送订餐与门店服务投诉',
      ),
      EmergencyNumber(
        name: '麦当劳麦乐送',
        number: '400-851-7517',
        desc: 'McDonald\'s麦当劳麦乐送外送服务热线',
      ),
      EmergencyNumber(
        name: '必胜客宅急送',
        number: '400-812-3123',
        desc: 'PizzaHut必胜客外送订餐与售后客服',
      ),
      EmergencyNumber(
        name: '海底捞外送',
        number: '400-910-7107',
        desc: '海底捞火锅订座与欢乐送外卖官方客服',
      ),
      EmergencyNumber(
        name: '星巴克专星送',
        number: '400-820-6998',
        desc: '星巴克中国会员卡与专星送外送客服',
      ),
      EmergencyNumber(
        name: '瑞幸咖啡客服',
        number: '400-010-0100',
        desc: 'luckin瑞幸咖啡订单异常与售后客服',
      ),
      EmergencyNumber(
        name: '达美乐比萨',
        number: '400-159-7597',
        desc: '达美乐比萨30分钟必达外送订餐热线',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'telecom',
    title: '通信网络',
    icon: '📶',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '工信部电信申诉',
        number: '12300',
        desc: '携号转网受阻、乱扣套餐费向工信部官方申诉',
      ),
      EmergencyNumber(
        name: '中国移动客服',
        number: '10086',
        desc: '移动话费流量查询、宽带报修与SIM卡挂失',
      ),
      EmergencyNumber(
        name: '中国联通客服',
        number: '10010',
        desc: '联通话费套餐变更、宽带报障与人工客服',
      ),
      EmergencyNumber(
        name: '中国电信客服',
        number: '10000',
        desc: '电信光纤宽带报修、天翼手机套餐与挂失',
      ),
      EmergencyNumber(
        name: '中国广电客服',
        number: '10099',
        desc: '广电5G手机卡与有线电视业务全国客服',
      ),
      EmergencyNumber(
        name: '移动国际漫游',
        number: '13800100186',
        desc: '境外漫游时免费拨打中国移动全球客服热线',
      ),
      EmergencyNumber(
        name: '垃圾骚扰举报',
        number: '12321',
        desc: '营销骚扰电话、诈骗短信屏蔽与工信部举报',
      ),
      EmergencyNumber(
        name: '全国百事通查号',
        number: '114',
        desc: '全国企事业单位电话查询、挪车服务转接',
      ),
      EmergencyNumber(
        name: '紧急呼叫中心',
        number: '112',
        desc: '手机无SIM卡或欠费停机状态下紧急求救',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'utility',
    title: '生活服务',
    icon: '💡',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '国家电网抢修',
        number: '95598',
        desc: '全国绝大多数省份停电报修、电费查询与充电桩服务',
      ),
      EmergencyNumber(
        name: '南方电网抢修',
        number: '95598',
        desc: '广东/广西/云南/贵州/海南五省区供电抢修热线',
      ),
      EmergencyNumber(
        name: '市政公用城建',
        number: '12319',
        desc: '自来水爆管、井盖缺失、集中供暖不热、燃气市政热线',
      ),
      EmergencyNumber(
        name: '政务民生总台',
        number: '12345',
        desc: '停水停电停气停暖、物业纠纷一键转办当地专班',
      ),
      EmergencyNumber(
        name: '华润燃气抢修',
        number: '95777',
        desc: '华润燃气全国统一燃气泄漏抢险与报修热线',
      ),
      EmergencyNumber(
        name: '新奥燃气客服',
        number: '95158',
        desc: '新奥燃气全国统一漏气报修与购气服务热线',
      ),
      EmergencyNumber(
        name: '中国燃气客服',
        number: '95007',
        desc: '中燃百江燃气安装报修与安全检查热线',
      ),
      EmergencyNumber(
        name: '港华燃气客服',
        number: '95007',
        desc: '港华燃气客户服务与紧急报修咨询',
      ),
      EmergencyNumber(
        name: '中石化加油卡',
        number: '95105888',
        desc: '中国石化加油卡挂失、充值发票与道路救援',
      ),
      EmergencyNumber(
        name: '中石油昆仑卡',
        number: '95504',
        desc: '中国石油加油卡充值查询与油品服务热线',
      ),
      EmergencyNumber(
        name: '全国挪车服务',
        number: '12123',
        desc: '交管12123违章查询、一键通知挡道车主挪车',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'insurance',
    title: '保险服务',
    icon: '🛡️',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '银保监维权投诉',
        number: '12378',
        desc: '保险公司拒赔拖赔、销售误导官方监管投诉',
      ),
      EmergencyNumber(
        name: '中国人保PICC',
        number: '95518',
        desc: '人保车险出险报案、免费拖车搭电救援热线',
      ),
      EmergencyNumber(
        name: '平安保险客服',
        number: '95511',
        desc: '中国平安车险/寿险/健康险24小时报案理赔',
      ),
      EmergencyNumber(
        name: '太平洋保险',
        number: '95500',
        desc: '中国太保车险道路救援与人寿理赔服务热线',
      ),
      EmergencyNumber(
        name: '中国人寿客服',
        number: '95519',
        desc: '中国人寿寿险保单查询与重疾医疗报案',
      ),
      EmergencyNumber(
        name: '人保寿险客服',
        number: '400-889-5518',
        desc: '中国人民人寿保险保单与理赔专线',
      ),
      EmergencyNumber(
        name: '泰康保险客服',
        number: '95522',
        desc: '泰康人寿/泰康在线医疗险报案理赔热线',
      ),
      EmergencyNumber(
        name: '新华保险客服',
        number: '95567',
        desc: '新华人寿保单保全与理赔报案服务热线',
      ),
      EmergencyNumber(
        name: '中国太平保险',
        number: '95589',
        desc: '太平人寿/太平财险全国统一报案客服',
      ),
      EmergencyNumber(
        name: '阳光保险客服',
        number: '95510',
        desc: '阳光车险现场查勘救援与寿险理赔热线',
      ),
      EmergencyNumber(
        name: '大地保险客服',
        number: '95590',
        desc: '中国大地财产保险车险报案与道路救援',
      ),
      EmergencyNumber(
        name: '中华联合保险',
        number: '95585',
        desc: '中华保险车险农险报案与理赔服务热线',
      ),
      EmergencyNumber(
        name: '众安在线保险',
        number: '1010-9955',
        desc: '众安百万医疗险、退货运费险官方理赔客服',
      ),
      EmergencyNumber(
        name: '友邦人寿AIA',
        number: '400-820-3588',
        desc: '友邦保险健康险理赔与客户服务热线',
      ),
    ],
  ),
  EmergencyCategory(
    id: 'kids',
    title: '妇幼与心理救援',
    icon: '🧒',
    numbers: <EmergencyNumber>[
      EmergencyNumber(
        name: '儿童失踪立即报警',
        number: '110',
        desc: '儿童走失无需等待24小时！请立即拨打110启动团圆系统',
      ),
      EmergencyNumber(
        name: '全国妇联维权',
        number: '12338',
        desc: '遭遇家庭暴力、妇女儿童权益侵害公益救助热线',
      ),
      EmergencyNumber(
        name: '未成年人保护',
        number: '12349',
        desc: '民政部门未成年人救助保护、困境儿童帮扶热线',
      ),
      EmergencyNumber(
        name: '青少年心理与维权',
        number: '12355',
        desc: '校园欺凌求助、中高考减压与青少年心理辅导',
      ),
      EmergencyNumber(
        name: '全国希望24热线',
        number: '400-161-9995',
        desc: '24小时免费心理危机干预与情绪急救生命热线',
      ),
      EmergencyNumber(
        name: '北京心理危机研究',
        number: '800-810-1117',
        desc: '北京回龙观医院24小时免费心理危机干预热线',
      ),
      EmergencyNumber(
        name: '医疗急救心理转介',
        number: '12320',
        desc: '卫健委官方心理健康援助与精神卫生咨询',
      ),
    ],
  ),
];

/// 紧急电话：全国通用号码分类速查 + 一键拨打
///
/// 移植自懒得找了 EmergencyPhoneSection.kt + EmergencyPhoneData.kt：
/// - 14 大分类上下收纳（点击标题展开/收起，默认全部展开）
/// - 搜索单位名称 / 电话号码 / 用途，命中时自动展开对应分类
/// - 一键全部展开 / 全部收起
/// - 每个号码右侧「拨打」按钮：url_launcher 打开 tel: 链接（系统拨号盘预填）
/// 注：源码中的六级地区选择弹窗（RegionPickerDialog）在原 Section 中未被调用，
/// 为未渲染的死代码，本次未移植；全部 14 分类 193 个号码数据完整保留。
class EmergencyPhoneToolPage extends StatefulWidget {
  const EmergencyPhoneToolPage({super.key});
  static const String pageTitle = '紧急电话';

  @override
  State<EmergencyPhoneToolPage> createState() => _EmergencyPhoneToolPageState();
}

class _EmergencyPhoneToolPageState extends State<EmergencyPhoneToolPage> {
  late Set<String> _expandedCats;
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _expandedCats = kEmergencyCategories.map((c) => c.id).toSet();
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Future<void> _callNumber(String number) async {
    final clean = number.replaceAll(RegExp(r'[^0-9+]'), '');
    final uri = Uri.parse('tel:$clean');
    try {
      final ok = await launchUrl(uri);
      if (!ok && mounted) _toast('无法打开拨号盘');
    } catch (_) {
      if (mounted) _toast('无法呼出该号码');
    }
  }

  /// 轻量 Toast（本项目二级页无 Scaffold，不用 ScaffoldMessenger）
  void _toast(String msg) {
    final overlay = Overlay.of(context);
    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => Positioned(
        bottom: 90,
        left: 40,
        right: 40,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(10)),
            child: Text(msg,
                textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 13)),
          ),
        ),
      ),
    );
    overlay.insert(entry);
    Future.delayed(const Duration(milliseconds: 1300), () {
      if (entry.mounted) entry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    const accent = Color(0xFFE23A3A);

    final q = _searchCtrl.text.trim();
    final children = <Widget>[
      // 顶部横幅
      GlassPanel(
        isDark: isDark,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(colors: [Color(0xFFE23A3A), Color(0xFFFF9500)]),
                ),
                child: const Icon(Icons.call, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('紧急电话 · 全国通用',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: pal.foreground)),
                    Text('救援/道路/举报/法律 · 一键快捷呼出 · 全国通用',
                        style: TextStyle(fontSize: 10.5, color: pal.secondary)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // 搜索 + 全部展开/收起
      Row(
        children: [
          Expanded(
            child: CupertinoTextField(
              controller: _searchCtrl,
              onChanged: (_) => setState(() {}),
              placeholder: '搜索单位名称、电话号码或用途（如：110 / 反诈 / 顺丰）',
              placeholderStyle: const TextStyle(fontSize: 11.5),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Builder(builder: (_) {
            final allIds = kEmergencyCategories.map((c) => c.id).toSet();
            final isAllExpanded = _expandedCats.length == allIds.length;
            return OutlinedButton(
              onPressed: () => setState(() {
                _expandedCats = isAllExpanded ? <String>{} : allIds;
              }),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
              child: Text(isAllExpanded ? '全部收起' : '全部展开',
                  style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold)),
            );
          }),
        ],
      ),
    ];

    for (final cat in kEmergencyCategories) {
      final matched = q.isEmpty
          ? cat.numbers
          : cat.numbers
              .where((n) =>
                  n.name.contains(q) || n.number.contains(q) || n.desc.contains(q) || cat.title.contains(q))
              .toList();
      if (matched.isEmpty) continue;

      final isExpanded = q.isNotEmpty || _expandedCats.contains(cat.id);
      children.add(
        Column(
          children: [
            // 分类标题栏
            InkWell(
              onTap: () => setState(() {
                if (_expandedCats.contains(cat.id)) {
                  _expandedCats.remove(cat.id);
                } else {
                  _expandedCats.add(cat.id);
                }
              }),
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                decoration: BoxDecoration(
                  color: isExpanded ? accent.withValues(alpha: 0.10) : Colors.white.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: isExpanded ? accent.withValues(alpha: 0.45) : Colors.grey.withValues(alpha: 0.18)),
                ),
                child: Row(
                  children: [
                    Text(cat.icon, style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(cat.title,
                          style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                              color: isExpanded ? accent : pal.foreground)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text('${matched.length} 个号码', style: TextStyle(fontSize: 10, color: pal.secondary)),
                    ),
                    Icon(isExpanded ? Icons.expand_less : Icons.expand_more,
                        size: 20, color: isExpanded ? accent : pal.secondary),
                  ],
                ),
              ),
            ),
            // 展开的号码列表
            if (isExpanded)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Column(
                  children: [
                    for (final num in matched) ...[
                      _NumberRow(
                        name: num.name,
                        number: num.number,
                        desc: num.desc,
                        icon: cat.icon,
                        onCall: () => _callNumber(num.number),
                      ),
                      const SizedBox(height: 6),
                    ],
                  ],
                ),
              ),
          ],
        ),
      );
    }

    return SubPage(
      title: EmergencyPhoneToolPage.pageTitle,
      child: SafeArea(
        child: TopFadeListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: children,
        ),
      ),
    );
  }
}

class _NumberRow extends StatelessWidget {
  const _NumberRow({required this.name, required this.number, required this.desc, required this.icon, required this.onCall});
  final String name;
  final String number;
  final String desc;
  final String icon;
  final VoidCallback onCall;

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    const accent = Color(0xFFE23A3A);
    return GlassPanel(
      isDark: isDark,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: accent.withValues(alpha: 0.12),
              ),
              alignment: Alignment.center,
              child: Text(icon, style: const TextStyle(fontSize: 17)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: pal.foreground)),
                  Row(
                    children: [
                      Text(number,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: accent)),
                      if (desc.isNotEmpty) ...[
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(desc,
                              style: TextStyle(fontSize: 9.5, color: pal.secondary),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            ElevatedButton.icon(
              onPressed: onCall,
              icon: const Icon(Icons.call, size: 14),
              label: const Text('拨打', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: accent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
