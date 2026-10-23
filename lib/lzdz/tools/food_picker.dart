import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';
import 'package:jicun/lzdz/toast.dart';

class Dish {
  final String id;
  final String name;
  final String cuisine;
  final String icon;
  final String ingredients;
  final String seasonings;
  final List<String> steps;
  final bool custom;
  const Dish({required this.id, required this.name, required this.cuisine,
    required this.icon, required this.ingredients, required this.seasonings,
    required this.steps, this.custom = false});
}

const List<String> kCuisines = <String>[
  '川菜',
  '粤菜',
  '湘菜',
  '江浙菜',
  '东北菜',
  '家常菜',
  '素食',
  '汤羹',
  '主食',
  '甜品小吃',
  '西餐',
  '日韩料理',
  '烧烤',
  '火锅',
  '面点',
];

const List<Dish> kDishDatabase = <Dish>[
  Dish(
    id: 'd_001',
    name: '麻婆豆腐',
    cuisine: '川菜',
    icon: '🌶️',
    ingredients: '嫩豆腐、牛肉末、蒜苗、姜蒜末',
    seasonings: '豆瓣酱、花椒粉、辣椒面、生抽、盐、糖、淀粉',
    steps: <String>[
      '豆腐切块焯水去豆腥',
      '热油炒香牛肉末，下豆瓣酱炒出红油',
      '加姜蒜末、辣椒面炒香，加水烧开',
      '下豆腐轻推煮 3 分钟，勾芡收汁',
      '撒花椒粉与蒜苗出锅',
    ],
  ),
  Dish(
    id: 'd_002',
    name: '宫保鸡丁',
    cuisine: '川菜',
    icon: '🥜',
    ingredients: '鸡胸肉、花生米、干辣椒、葱段、黄瓜',
    seasonings: '生抽、醋、糖、料酒、淀粉、花椒',
    steps: <String>[
      '鸡丁用料酒淀粉腌制 15 分钟',
      '调碗汁：生抽+醋+糖+淀粉+水',
      '热油滑熟鸡丁盛出',
      '爆香干辣椒花椒，倒入鸡丁与料汁',
      '加花生米葱段大火翻炒出锅',
    ],
  ),
  Dish(
    id: 'd_003',
    name: '水煮鱼',
    cuisine: '川菜',
    icon: '🐟',
    ingredients: '草鱼片、豆芽、千张、干辣椒、花椒、姜蒜',
    seasonings: '豆瓣酱、料酒、淀粉、盐、辣椒面、蛋清',
    steps: <String>[
      '鱼片加蛋清淀粉盐腌制',
      '豆芽千张焯水铺碗底',
      '豆瓣酱炒出红油加水烧开下鱼片',
      '煮至变色连汤倒入碗中',
      '铺辣椒面干辣椒花椒，热油淋上激香',
    ],
  ),
  Dish(
    id: 'd_004',
    name: '回锅肉',
    cuisine: '川菜',
    icon: '🥓',
    ingredients: '五花肉、蒜苗、青椒、姜片',
    seasonings: '豆瓣酱、甜面酱、生抽、白糖、豆豉',
    steps: <String>[
      '五花肉冷水下锅煮 20 分钟切薄片',
      '煸炒至出油卷起呈灯盏窝',
      '下豆瓣酱豆豉炒出红油',
      '加甜面酱生抽白糖调味',
      '下蒜苗青椒大火快炒出锅',
    ],
  ),
  Dish(
    id: 'd_005',
    name: '夫妻肺片',
    cuisine: '川菜',
    icon: '🥩',
    ingredients: '牛头皮、牛心、牛舌、花生碎、香菜',
    seasonings: '红油、花椒油、生抽、醋、白糖、芝麻',
    steps: <String>[
      '牛杂卤熟切片摆盘',
      '调红油料汁（红油+花椒油+生抽+醋+糖）',
      '料汁浇在牛杂上',
      '撒花生碎、白芝麻、香菜即可',
    ],
  ),
  Dish(
    id: 'd_006',
    name: '白切鸡',
    cuisine: '粤菜',
    icon: '🍗',
    ingredients: '三黄鸡、姜、葱',
    seasonings: '盐、花生油、酱油、蒜蓉',
    steps: <String>[
      '整鸡开水下锅浸煮 25 分钟',
      '捞出立即入冰水收紧鸡皮',
      '斩件摆盘',
      '姜蓉蒜蓉+盐+热油调蘸料，淋酱油即可',
    ],
  ),
  Dish(
    id: 'd_007',
    name: '清蒸鲈鱼',
    cuisine: '粤菜',
    icon: '🐠',
    ingredients: '鲈鱼、姜丝、葱丝、红椒丝',
    seasonings: '蒸鱼豉油、料酒、花生油、盐',
    steps: <String>[
      '鲈鱼两面打花刀，料酒盐抹匀',
      '铺姜丝水开大火蒸 8 分钟',
      '倒掉汤汁，铺葱丝红椒丝',
      '淋热油激香，浇蒸鱼豉油即可',
    ],
  ),
  Dish(
    id: 'd_008',
    name: '虾仁炒蛋',
    cuisine: '粤菜',
    icon: '🍤',
    ingredients: '鲜虾仁、鸡蛋、葱花',
    seasonings: '盐、料酒、白胡椒粉、牛奶',
    steps: <String>[
      '虾仁料酒盐腌 10 分钟',
      '鸡蛋加少许牛奶盐打散',
      '热油滑炒虾仁至变色盛出',
      '倒入蛋液快炒，半凝固时回虾仁',
      '撒葱花炒匀出锅',
    ],
  ),
  Dish(
    id: 'd_009',
    name: '蜜汁叉烧',
    cuisine: '粤菜',
    icon: '🍖',
    ingredients: '梅花肉、姜蒜',
    seasonings: '叉烧酱、蜂蜜、生抽、料酒',
    steps: <String>[
      '梅花肉用叉烧酱生抽料酒腌一夜',
      '烤箱 200 度烤 20 分钟',
      '刷蜂蜜翻面再烤 15 分钟',
      '晾凉切片装盘即可',
    ],
  ),
  Dish(
    id: 'd_010',
    name: '剁椒鱼头',
    cuisine: '湘菜',
    icon: '🐡',
    ingredients: '胖头鱼鱼头、剁椒、姜末、蒜末、葱花',
    seasonings: '蒸鱼豉油、料酒、白糖、猪油',
    steps: <String>[
      '鱼头对半剖开，料酒盐抹匀腌 10 分钟',
      '铺满剁椒与姜蒜末',
      '水开大火蒸 12 分钟',
      '淋蒸鱼豉油，铺葱花浇热油即可',
    ],
  ),
  Dish(
    id: 'd_011',
    name: '小炒黄牛肉',
    cuisine: '湘菜',
    icon: '🐮',
    ingredients: '黄牛肉、小米辣、泡椒、蒜、香菜',
    seasonings: '生抽、蚝油、淀粉、料酒、油',
    steps: <String>[
      '牛肉逆纹切薄片，料酒淀粉腌 10 分钟',
      '热锅冷油快速滑炒牛肉至变色盛出',
      '爆香蒜末小米辣泡椒',
      '回牛肉加生抽蚝油大火爆炒',
      '撒香菜段炒匀出锅',
    ],
  ),
  Dish(
    id: 'd_012',
    name: '辣椒炒肉',
    cuisine: '湘菜',
    icon: '🌶️',
    ingredients: '五花肉、螺丝椒、蒜片',
    seasonings: '生抽、老抽、豆豉、盐',
    steps: <String>[
      '螺丝椒拍扁切段干煸至虎皮盛出',
      '五花肉煸炒出油',
      '下蒜片豆豉炒香',
      '回辣椒加生抽老抽盐，大火翻炒出锅',
    ],
  ),
  Dish(
    id: 'd_013',
    name: '红烧肉',
    cuisine: '江浙菜',
    icon: '🍖',
    ingredients: '五花肉、姜片、葱结、八角',
    seasonings: '冰糖、生抽、老抽、料酒',
    steps: <String>[
      '五花肉切块焯水',
      '小火炒糖色至琥珀色',
      '下肉块翻炒上色',
      '加生抽老抽料酒热水，小火炖 40 分钟',
      '大火收汁至浓稠即可',
    ],
  ),
  Dish(
    id: 'd_014',
    name: '西湖醋鱼',
    cuisine: '江浙菜',
    icon: '🐟',
    ingredients: '草鱼、姜末',
    seasonings: '香醋、白糖、生抽、料酒、淀粉',
    steps: <String>[
      '草鱼剖两半汆水 3 分钟',
      '用糖醋汁（醋+糖+生抽）烧开',
      '湿淀粉勾芡成琉璃芡',
      '浇在鱼身上撒姜末即可',
    ],
  ),
  Dish(
    id: 'd_015',
    name: '龙井虾仁',
    cuisine: '江浙菜',
    icon: '🍤',
    ingredients: '鲜虾仁、龙井茶叶、蛋清',
    seasonings: '盐、料酒、淀粉、猪油',
    steps: <String>[
      '虾仁用蛋清淀粉盐上浆',
      '龙井茶泡开沥出茶叶',
      '温油滑炒虾仁至变白',
      '下茶叶与少许茶汁翻炒即可',
    ],
  ),
  Dish(
    id: 'd_016',
    name: '锅包肉',
    cuisine: '东北菜',
    icon: '🥢',
    ingredients: '猪里脊、淀粉、葱姜丝、胡萝卜丝',
    seasonings: '白醋、白糖、生抽、盐',
    steps: <String>[
      '里脊切大片，淀粉糊挂浆',
      '油温六成热炸至定型捞出',
      '复炸至金黄酥脆',
      '调糖醋汁烧开，下肉片快速裹汁',
      '撒葱姜丝胡萝卜丝出锅',
    ],
  ),
  Dish(
    id: 'd_017',
    name: '猪肉炖粉条',
    cuisine: '东北菜',
    icon: '🍲',
    ingredients: '五花肉、红薯粉条、白菜、姜葱',
    seasonings: '生抽、老抽、盐、八角、桂皮',
    steps: <String>[
      '五花肉煸炒出油',
      '加葱姜八角桂皮炒香，烹生抽老抽',
      '加热水炖 20 分钟',
      '下粉条白菜再炖 15 分钟',
      '收汁调味即可',
    ],
  ),
  Dish(
    id: 'd_018',
    name: '地三鲜',
    cuisine: '东北菜',
    icon: '🍆',
    ingredients: '茄子、土豆、青椒、蒜末',
    seasonings: '生抽、老抽、蚝油、糖、淀粉',
    steps: <String>[
      '土豆茄子切块炸至金黄',
      '青椒过油断生',
      '调碗汁（生抽+蚝油+糖+淀粉）',
      '蒜末爆香，回所有食材淋汁',
      '大火翻炒收汁即可',
    ],
  ),
  Dish(
    id: 'd_019',
    name: '番茄炒蛋',
    cuisine: '家常菜',
    icon: '🍅',
    ingredients: '番茄、鸡蛋、葱花',
    seasonings: '盐、白糖、番茄酱',
    steps: <String>[
      '鸡蛋加盐打散炒熟盛出',
      '番茄切块炒出汁',
      '加少许白糖番茄酱调味',
      '回鸡蛋翻炒，撒葱花出锅',
    ],
  ),
  Dish(
    id: 'd_020',
    name: '可乐鸡翅',
    cuisine: '家常菜',
    icon: '🍗',
    ingredients: '鸡翅中、姜片、可乐',
    seasonings: '生抽、老抽、料酒、盐',
    steps: <String>[
      '鸡翅两面划刀焯水',
      '煎至两面金黄',
      '倒入可乐没过鸡翅，加生抽老抽',
      '中小火焖 15 分钟',
      '大火收汁至浓稠即可',
    ],
  ),
  Dish(
    id: 'd_021',
    name: '鱼香肉丝',
    cuisine: '家常菜',
    icon: '🥕',
    ingredients: '猪里脊、木耳、胡萝卜、青椒、笋丝',
    seasonings: '豆瓣酱、糖、醋、生抽、淀粉',
    steps: <String>[
      '肉丝料酒淀粉腌 10 分钟',
      '热油滑熟肉丝盛出',
      '豆瓣酱炒出红油',
      '下配菜翻炒，回肉丝淋鱼香汁',
      '大火翻炒收汁出锅',
    ],
  ),
  Dish(
    id: 'd_022',
    name: '酸辣土豆丝',
    cuisine: '家常菜',
    icon: '🥔',
    ingredients: '土豆、干辣椒、青红椒丝、蒜片',
    seasonings: '白醋、盐、花椒',
    steps: <String>[
      '土豆切细丝泡水去淀粉',
      '热油爆香花椒干辣椒蒜片',
      '大火快炒土豆丝',
      '沿锅边烹醋，加盐调味',
      '加青红椒丝炒匀出锅',
    ],
  ),
  Dish(
    id: 'd_023',
    name: '糖醋排骨',
    cuisine: '家常菜',
    icon: '🍖',
    ingredients: '肋排、姜片、白芝麻',
    seasonings: '冰糖、香醋、生抽、料酒',
    steps: <String>[
      '排骨焯水后煎至微黄',
      '加冰糖炒出糖色',
      '烹料酒生抽，加热水炖 30 分钟',
      '加香醋大火收汁',
      '撒白芝麻装盘',
    ],
  ),
  Dish(
    id: 'd_024',
    name: '手撕包菜',
    cuisine: '素食',
    icon: '🥬',
    ingredients: '包菜、干辣椒、蒜片',
    seasonings: '生抽、陈醋、盐、白糖',
    steps: <String>[
      '包菜手撕成片洗净沥干',
      '热油爆香干辣椒蒜片',
      '大火快炒包菜至断生',
      '淋生抽陈醋，加盐糖调味出锅',
    ],
  ),
  Dish(
    id: 'd_025',
    name: '蒜蓉西兰花',
    cuisine: '素食',
    icon: '🥦',
    ingredients: '西兰花、蒜末、枸杞',
    seasonings: '盐、蚝油、淀粉、花生油',
    steps: <String>[
      '西兰花掰小朵焯水 1 分钟',
      '热油爆香蒜末',
      '下西兰花翻炒',
      '加蚝油盐调味，勾薄芡出锅',
    ],
  ),
  Dish(
    id: 'd_026',
    name: '西红柿鸡蛋汤',
    cuisine: '汤羹',
    icon: '🍲',
    ingredients: '番茄、鸡蛋、葱花',
    seasonings: '盐、白胡椒粉、香油',
    steps: <String>[
      '番茄炒出沙',
      '加水烧开',
      '淋入打散的蛋液成蛋花',
      '加盐白胡椒粉，点香油撒葱花即可',
    ],
  ),
  Dish(
    id: 'd_027',
    name: '玉米排骨汤',
    cuisine: '汤羹',
    icon: '🌽',
    ingredients: '排骨、甜玉米、胡萝卜、姜片',
    seasonings: '盐、料酒',
    steps: <String>[
      '排骨焯水去沫',
      '与玉米胡萝卜姜片同入锅',
      '加足量水大火烧开转小火',
      '炖 60 分钟，加盐调味即可',
    ],
  ),
  Dish(
    id: 'd_028',
    name: '蛋炒饭',
    cuisine: '主食',
    icon: '🍚',
    ingredients: '隔夜米饭、鸡蛋、火腿丁、葱花',
    seasonings: '盐、生抽、白胡椒粉',
    steps: <String>[
      '鸡蛋炒散盛出',
      '底饭下锅炒散炒透',
      '回鸡蛋，加火腿丁翻炒',
      '淋生抽撒盐，大火炒香',
      '撒葱花出锅',
    ],
  ),
  Dish(
    id: 'd_029',
    name: '番茄鸡蛋面',
    cuisine: '主食',
    icon: '🍜',
    ingredients: '面条、番茄、鸡蛋、青菜',
    seasonings: '盐、生抽、葱花、香油',
    steps: <String>[
      '番茄炒出沙加水烧开',
      '下面条煮 3 分钟',
      '淋入蛋液成蛋花',
      '下青菜，加盐生抽调味',
      '点香油撒葱花出锅',
    ],
  ),
  Dish(
    id: 'd_030',
    name: '拔丝地瓜',
    cuisine: '甜品小吃',
    icon: '🍠',
    ingredients: '红薯、白糖',
    seasonings: '食用油、白芝麻',
    steps: <String>[
      '红薯切滚刀块炸至金黄',
      '锅中糖加水小火熬至琥珀色',
      '下红薯快速翻裹糖浆',
      '装盘拉丝，撒白芝麻，配凉水碗',
    ],
  ),
  Dish(
    id: 'd_031',
    name: '红糖糍粑',
    cuisine: '甜品小吃',
    icon: '🍡',
    ingredients: '糯米粉、温水、黄豆粉',
    seasonings: '红糖、白糖',
    steps: <String>[
      '糯米粉加温水揉团',
      '整形成长条煎至金黄',
      '红糖加水熬成糖浆',
      '浇在糍粑上撒黄豆粉即可',
    ],
  ),
  Dish(
    id: 'd_032',
    name: '黑椒牛柳意面',
    cuisine: '西餐',
    icon: '🍝',
    ingredients: '意大利面、牛里脊、彩椒、洋葱',
    seasonings: '黑胡椒酱、生抽、盐、橄榄油',
    steps: <String>[
      '意面煮 9 分钟过凉水',
      '牛柳条黑椒酱腌制',
      '热油煎牛柳至七分熟',
      '下洋葱彩椒翻炒，回意面与黑椒酱',
      '翻拌均匀出锅',
    ],
  ),
  Dish(
    id: 'd_033',
    name: '奶油蘑菇汤',
    cuisine: '西餐',
    icon: '🥣',
    ingredients: '口蘑、洋葱、淡奶油、黄油',
    seasonings: '盐、黑胡椒、面粉',
    steps: <String>[
      '黄油炒香洋葱末',
      '下蘑菇片炒软撒面粉炒匀',
      '加水煮 10 分钟',
      '料理机打细腻回锅',
      '加淡奶油盐黑胡椒调味即可',
    ],
  ),
  Dish(
    id: 'd_034',
    name: '寿喜烧',
    cuisine: '日韩料理',
    icon: '🍲',
    ingredients: '肥牛、豆腐、香菇、娃娃菜、茼蒿、魔芋丝',
    seasonings: '寿喜烧汁（酱油+味淋+糖+清酒）、黄油',
    steps: <String>[
      '黄油融化煎香肥牛卷',
      '倒入寿喜烧汁',
      '下豆腐香菇娃娃菜等焖煮',
      '边煮边吃，蘸生蛋液更嫩滑',
    ],
  ),
  Dish(
    id: 'd_035',
    name: '韩式辣炒年糕',
    cuisine: '日韩料理',
    icon: '🍥',
    ingredients: '年糕条、鱼饼、洋葱、大葱',
    seasonings: '韩式辣酱、糖、生抽、芝麻',
    steps: <String>[
      '年糕煮软',
      '韩式辣酱+糖+生抽+水调酱汁',
      '酱汁煮开下年糕鱼饼洋葱',
      '煮至浓稠撒芝麻葱花即可',
    ],
  ),
  Dish(
    id: 'd_036',
    name: '日式咖喱鸡饭',
    cuisine: '日韩料理',
    icon: '🍛',
    ingredients: '鸡腿肉、土豆、胡萝卜、洋葱、米饭',
    seasonings: '咖喱块、生抽、料酒',
    steps: <String>[
      '鸡肉煎至金黄',
      '下洋葱炒软，加土豆胡萝卜翻炒',
      '加水没过食材煮 15 分钟',
      '关火加咖喱块融化',
      '小火煮至浓稠浇在米饭上',
    ],
  ),
  Dish(
    id: 'd_037',
    name: '蜜汁烤鸡翅',
    cuisine: '烧烤',
    icon: '🍗',
    ingredients: '鸡翅中、姜蒜',
    seasonings: '蜂蜜、生抽、蚝油、黑胡椒、孜然',
    steps: <String>[
      '鸡翅划刀，生抽蚝油蜂蜜腌 2 小时',
      '烤箱 200 度烤 15 分钟',
      '翻面刷腌汁再烤 10 分钟',
      '撒孜然黑胡椒再烤 2 分钟即可',
    ],
  ),
  Dish(
    id: 'd_038',
    name: '孜然羊肉串',
    cuisine: '烧烤',
    icon: '🍢',
    ingredients: '羊腿肉、洋葱',
    seasonings: '孜然粉、辣椒面、盐、生抽、蛋清',
    steps: <String>[
      '羊肉切块洋葱生抽腌 1 小时',
      '穿串，烤 5 分钟',
      '刷油撒孜然辣椒面',
      '翻面再烤 5 分钟至滋滋冒油',
    ],
  ),
  Dish(
    id: 'd_039',
    name: '番茄牛腩锅',
    cuisine: '火锅',
    icon: '🍅',
    ingredients: '牛腩、番茄、土豆、香菇、金针菇、各类涮菜',
    seasonings: '番茄酱、生抽、盐、姜片、八角',
    steps: <String>[
      '牛腩焯水炖 40 分钟',
      '番茄炒出沙加番茄酱',
      '倒入牛腩汤中煮开',
      '下土豆香菇等配菜',
      '涮菜上桌开吃',
    ],
  ),
  Dish(
    id: 'd_040',
    name: '菌菇鸡汤锅',
    cuisine: '火锅',
    icon: '🍄',
    ingredients: '半只鸡、各类菌菇、豆腐、娃娃菜、虾滑',
    seasonings: '盐、姜片、枸杞、料酒',
    steps: <String>[
      '鸡肉焯水后加姜片炖 30 分钟',
      '下菌菇继续炖 15 分钟',
      '加盐枸杞调味',
      '涮豆腐娃娃菜虾滑等配菜',
    ],
  ),
  Dish(
    id: 'd_041',
    name: '韭菜鸡蛋饺子',
    cuisine: '面点',
    icon: '🥟',
    ingredients: '饺子皮、韭菜、鸡蛋、虾皮',
    seasonings: '盐、香油、生抽、白胡椒粉',
    steps: <String>[
      '鸡蛋炒碎放凉',
      '韭菜切末与鸡蛋虾皮拌匀',
      '加盐香油白胡椒粉调味',
      '包饺子，水开下锅煮至浮起再煮 2 分钟',
    ],
  ),
  Dish(
    id: 'd_042',
    name: '葱油饼',
    cuisine: '面点',
    icon: '🫓',
    ingredients: '面粉、小葱、温水',
    seasonings: '盐、油、五香粉',
    steps: <String>[
      '面粉温水揉团醒 30 分钟',
      '擀开撒盐五香粉葱花，卷起盘圆',
      '再擀成饼，平底锅烙至两面金黄',
      '层层酥脆，撕开即食',
    ],
  ),
];

/// 今天吃什么：15 大菜系 / 40+ 道菜随机摇签
///
/// 移植自懒得找了 FoodPickerSection.kt：
/// - 15 大菜系筛选（不选=全部），只抽我最爱模式
/// - 做几个菜：1-5 快捷 + 自定 1-10
/// - 摇色子随机（本轮不重复），结果可一键复制完整菜单
/// - 每道菜可收藏 / 单独复制；可录入我的菜（本会话内存保存）与管理删除
/// 注：源码用 SharedPreferences 持久化自录菜与收藏；
/// 本移植不引入第三方包，改为本会话内存保存。
class FoodPickerToolPage extends StatefulWidget {
  const FoodPickerToolPage({super.key});
  static const String pageTitle = '今天吃什么';

  @override
  State<FoodPickerToolPage> createState() => _FoodPickerToolPageState();
}

class _FoodPickerToolPageState extends State<FoodPickerToolPage> {
  final List<Dish> _customDishes = <Dish>[];
  final Set<String> _favorites = <String>{};
  final Set<String> _selectedCuisines = <String>{};
  int _dishCount = 1;
  final TextEditingController _customCountCtrl = TextEditingController();
  List<Dish> _result = <Dish>[];
  bool _rolling = false;
  bool _onlyFavoritesMode = false;
  bool _showAddDialog = false;
  bool _showManageDialog = false;
  double _diceAngle = 0;

  @override
  void dispose() {
    _customCountCtrl.dispose();
    super.dispose();
  }

  List<Dish> get _allDishes => <Dish>[...kDishDatabase, ..._customDishes];

  int _effectiveCount() {
    final custom = int.tryParse(_customCountCtrl.text);
    if (custom != null && custom >= 1 && custom <= 10) return custom;
    return _dishCount.clamp(1, 10);
  }

  void _rollDice() {
    final pool = () {
      if (_onlyFavoritesMode) {
        return _allDishes.where((d) => _favorites.contains(d.id)).toList();
      }
      if (_selectedCuisines.isEmpty) return _allDishes;
      return _allDishes.where((d) => _selectedCuisines.contains(d.cuisine)).toList();
    }();
    // 去重
    final seen = <String>{};
    final distinct = pool.where((d) => seen.add(d.id)).toList();
    if (distinct.isEmpty) return;
    distinct.shuffle(Random());
    final n = _effectiveCount().clamp(1, distinct.length);
    setState(() => _result = distinct.take(n).toList());
  }

  Future<void> _onRollTap() async {
    if (_rolling) return;
    setState(() {
      _rolling = true;
      _result = <Dish>[];
    });
    for (var i = 0; i < 7; i++) {
      await Future.delayed(const Duration(milliseconds: 130));
      if (!mounted) return;
      setState(() => _diceAngle += pi / 3);
    }
    if (!mounted) return;
    _rollDice();
    setState(() => _rolling = false);
  }

  String _dishClipboardText(Dish d) {
    final sb = StringBuffer();
    sb.writeln('🍳 ${d.name} (${d.cuisine})');
    sb.writeln('🧂 配料：${d.ingredients}');
    sb.writeln('🌶️ 调味料：${d.seasonings}');
    sb.writeln('👨‍🍳 制作步骤：');
    for (var i = 0; i < d.steps.length; i++) {
      sb.writeln('  ${i + 1}. ${d.steps[i]}');
    }
    return sb.toString();
  }

  Future<void> _copyText(String label, String text, String toast) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    _toast(toast);
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

  void _toggleFavorite(Dish dish) {
    setState(() {
      if (_favorites.contains(dish.id)) {
        _favorites.remove(dish.id);
      } else {
        _favorites.add(dish.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);

    final children = <Widget>[
      // 顶部标题卡
      GlassPanel(
        isDark: isDark,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(colors: [Color(0xFFFF8A3D), Color(0xFFE23A3A)]),
                    ),
                    alignment: Alignment.center,
                    child: const Text('🍽️', style: TextStyle(fontSize: 22)),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('今天吃什么？', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: pal.foreground)),
                        Text('15 大菜系 / 40+ 道菜 / 自录菜品 / 我的最爱 / 自定菜数',
                            style: TextStyle(fontSize: 11, color: pal.secondary)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _entryBtn(
                      context,
                      icon: Icons.add,
                      iconColor: const Color(0xFF2E9E5B),
                      label: '录入我的菜',
                      onTap: () => setState(() => _showAddDialog = true),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: _entryBtn(
                      context,
                      emoji: '📚',
                      iconColor: const Color(0xFF7C4DFF),
                      label: '管理我的菜（${_customDishes.length}）',
                      onTap: () => setState(() => _showManageDialog = true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // 菜系选择
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('选择菜系（不选 = 全部）',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: pal.secondary)),
              ),
              if (_favorites.isNotEmpty)
                InkWell(
                  onTap: () => setState(() => _onlyFavoritesMode = !_onlyFavoritesMode),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: _onlyFavoritesMode ? const Color(0xFFE23A3A) : Colors.white.withValues(alpha: 0.55),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: _onlyFavoritesMode ? const Color(0xFFE23A3A) : Colors.transparent),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(_onlyFavoritesMode ? Icons.favorite : Icons.favorite_border,
                            size: 12, color: _onlyFavoritesMode ? Colors.white : const Color(0xFFE23A3A)),
                        const SizedBox(width: 4),
                        Text('只抽我最爱（${_favorites.length}）',
                            style: TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.bold,
                                color: _onlyFavoritesMode ? Colors.white : const Color(0xFFE23A3A))),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: kCuisines.map((cuisine) {
              final selected = _selectedCuisines.contains(cuisine);
              return InkWell(
                onTap: () => setState(() {
                  if (selected) {
                    _selectedCuisines.remove(cuisine);
                  } else {
                    _selectedCuisines.add(cuisine);
                  }
                  _onlyFavoritesMode = false;
                }),
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                    color: selected ? const Color(0xFFFF8A3D).withValues(alpha: 0.25) : Colors.white.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: selected ? const Color(0xFFFF8A3D) : Colors.transparent),
                  ),
                  child: Text(cuisine,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 11.5,
                          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                          color: selected ? const Color(0xFFFF8A3D) : pal.foreground)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
      // 做几个菜
      GlassPanel(
        isDark: isDark,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('做几个菜：', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: pal.secondary)),
                  const SizedBox(width: 8),
                  for (var n = 1; n <= 5; n++) ...[
                    _countDot(context, n),
                    if (n < 5) const SizedBox(width: 6),
                  ],
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text('自定：', style: TextStyle(fontSize: 11.5, color: pal.secondary, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 4),
                  SizedBox(
                    width: 140,
                    child: CupertinoTextField(
                      controller: _customCountCtrl,
                      keyboardType: TextInputType.number,
                      onChanged: (_) => setState(() {}),
                      placeholder: '1-10 之间任意数',
                      placeholderStyle: const TextStyle(fontSize: 11),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text('当前：${_effectiveCount()} 道',
                      style: const TextStyle(fontSize: 11, color: Color(0xFFE23A3A), fontWeight: FontWeight.w900)),
                ],
              ),
            ],
          ),
        ),
      ),
      // 摇色子按钮
      SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          onPressed: _rolling ? null : _onRollTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE23A3A),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.22),
                  borderRadius: BorderRadius.circular(7),
                ),
                alignment: Alignment.center,
                child: Transform.rotate(angle: _diceAngle, child: const Text('🎲', style: TextStyle(fontSize: 16))),
              ),
              const SizedBox(width: 8),
              Text(_rolling ? '摇骰子中…' : '🎲 随机色子 · 摇出${_effectiveCount()}道菜',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
            ],
          ),
        ),
      ),
      // 结果
      if (_result.isNotEmpty) ...[
        Row(
          children: [
            Expanded(
              child: Text('🍳 今日菜单（${_result.length} 道）',
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: Color(0xFF7C4DFF))),
            ),
            InkWell(
              onTap: () {
                final text = '🍳 今日菜单（${_result.length} 道）\n\n' +
                    _result.map(_dishClipboardText).join('\n\n');
                _copyText('今日菜单', text, '已复制完整菜单到剪贴板');
              },
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF7C4DFF).withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF7C4DFF).withValues(alpha: 0.4)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.content_copy, size: 12, color: Color(0xFF7C4DFF)),
                    SizedBox(width: 4),
                    Text('一键复制', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF7C4DFF))),
                  ],
                ),
              ),
            ),
          ],
        ),
        for (final dish in _result)
          _DishCard(
            dish: dish,
            isFavorited: _favorites.contains(dish.id),
            onToggleFavorite: () => _toggleFavorite(dish),
            onCopy: () => _copyText(dish.name, _dishClipboardText(dish), '已复制 ${dish.name}'),
          ),
      ] else if (!_rolling)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 30),
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text('🍚', style: TextStyle(fontSize: 40)),
              const SizedBox(height: 6),
              Text('点击「随机色子」，摇出今天吃什么！', style: TextStyle(fontSize: 12, color: pal.secondary)),
            ],
          ),
        ),
    ];

    return SubPage(
      title: FoodPickerToolPage.pageTitle,
      child: SafeArea(
        child: Stack(
          children: [
            TopFadeListView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
              children: children,
            ),
            if (_showAddDialog)
              _AddDishDialog(
                existingCuisines: <String>[...kCuisines, ..._customDishes.map((d) => d.cuisine)].toSet().toList(),
                onDismiss: () => setState(() => _showAddDialog = false),
                onToast: _toast,
                onSave: (dish) {
                  setState(() {
                    _customDishes.add(dish);
                    _showAddDialog = false;
                  });
                  _toast('已录入：${dish.name}');
                },
              ),
            if (_showManageDialog)
              _ManageDishesDialog(
                dishes: _customDishes,
                onDelete: (id) => setState(() => _customDishes.removeWhere((d) => d.id == id)),
                onDismiss: () => setState(() => _showManageDialog = false),
              ),
          ],
        ),
      ),
    );
  }

  Widget _entryBtn(BuildContext context, {IconData? icon, String? emoji, required Color iconColor, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: iconColor.withValues(alpha: 0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, size: 14, color: iconColor) else Text(emoji!, style: const TextStyle(fontSize: 13)),
            const SizedBox(width: 4),
            Text(label, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: iconColor)),
          ],
        ),
      ),
    );
  }

  Widget _countDot(BuildContext context, int n) {
    final selected = _dishCount == n && _customCountCtrl.text.isEmpty;
    return InkWell(
      onTap: () => setState(() {
        _dishCount = n;
        _customCountCtrl.clear();
      }),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selected ? const Color(0xFFE23A3A) : Colors.white.withValues(alpha: 0.7),
          border: Border.all(color: selected ? const Color(0xFFE23A3A) : Colors.transparent),
        ),
        child: Text('$n',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w900,
                color: selected ? Colors.white : Palette.of(CupertinoTheme.of(context).brightness == Brightness.dark).foreground)),
      ),
    );
  }
}

class _DishCard extends StatelessWidget {
  const _DishCard({required this.dish, required this.isFavorited, required this.onToggleFavorite, required this.onCopy});
  final Dish dish;
  final bool isFavorited;
  final VoidCallback onToggleFavorite;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    return GlassPanel(
      isDark: isDark,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(dish.icon, style: const TextStyle(fontSize: 22)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(dish.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900, color: pal.foreground)),
                ),
                IconButton(
                  onPressed: onToggleFavorite,
                  iconSize: 16,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints.tightFor(width: 28, height: 28),
                  icon: Icon(isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: isFavorited ? const Color(0xFFE23A3A) : Colors.grey.withValues(alpha: 0.6)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7C4DFF).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(dish.cuisine + (dish.custom ? ' · 我的' : ''),
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF7C4DFF))),
                ),
                const SizedBox(width: 6),
                IconButton(
                  onPressed: onCopy,
                  iconSize: 14,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints.tightFor(width: 28, height: 28),
                  icon: const Icon(Icons.content_copy, color: Color(0xFF7C4DFF)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _infoRow('🧂 配料', dish.ingredients, const Color(0xFFE65100)),
            const SizedBox(height: 6),
            _infoRow('🌶️ 调味料', dish.seasonings, const Color(0xFFC2185B)),
            if (dish.steps.isNotEmpty) ...[
              const SizedBox(height: 10),
              const Text('👨‍🍳 制作教程', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Color(0xFF7C4DFF))),
              const SizedBox(height: 4),
              for (var i = 0; i < dish.steps.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF2E9E5B).withValues(alpha: 0.2),
                        ),
                        alignment: Alignment.center,
                        child: Text('${i + 1}',
                            style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w900, color: Color(0xFF2E9E5B))),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(dish.steps[i],
                            style: TextStyle(fontSize: 12, height: 1.4, color: pal.foreground.withValues(alpha: 0.85))),
                      ),
                    ],
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(label, style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w900, color: color)),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Builder(builder: (context) {
            final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
            return Text(value.isEmpty ? '—' : value,
                style: TextStyle(fontSize: 12, height: 1.4, color: Palette.of(isDark).foreground.withValues(alpha: 0.85)));
          }),
        ),
      ],
    );
  }
}

/// 录入我的菜弹窗
class _AddDishDialog extends StatefulWidget {
  const _AddDishDialog({required this.existingCuisines, required this.onDismiss, required this.onSave, required this.onToast});
  final List<String> existingCuisines;
  final VoidCallback onDismiss;
  final ValueChanged<Dish> onSave;
  final ValueChanged<String> onToast;

  @override
  State<_AddDishDialog> createState() => _AddDishDialogState();
}

class _AddDishDialogState extends State<_AddDishDialog> {
  static const _icons = <String>['🍳', '🥘', '🍲', '🥗', '🍚', '🍜', '🥟', '🍢', '🍗', '🐟', '🥬', '🥕', '🍅', '🥔', '🌶️', '🥒', '🧅', '🥩', '🍖', '🍤'];
  final _nameCtrl = TextEditingController();
  final _ingCtrl = TextEditingController();
  final _seaCtrl = TextEditingController();
  final _stepsCtrl = TextEditingController();
  String _icon = '🍳';
  String _cuisine = '我的菜';
  bool _showCuisinePicker = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _ingCtrl.dispose();
    _seaCtrl.dispose();
    _stepsCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(onTap: widget.onDismiss, child: Container(color: Colors.black54)),
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            constraints: const BoxConstraints(maxHeight: 560),
            decoration: BoxDecoration(color: CupertinoTheme.of(context).brightness == Brightness.dark ? const Color(0xFF1E1E1E) : Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                  child: Row(
                    children: [
                      const Expanded(child: Text('📝 录入我的菜', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900))),
                      IconButton(icon: const Icon(Icons.close), onPressed: widget.onDismiss),
                    ],
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: _icons.map((ic) {
                            final sel = _icon == ic;
                            return InkWell(
                              onTap: () => setState(() => _icon = ic),
                              borderRadius: BorderRadius.circular(18),
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: sel ? const Color(0xFFFF8A3D).withValues(alpha: 0.35) : Colors.transparent,
                                  border: Border.all(color: sel ? const Color(0xFFFF8A3D) : Colors.transparent),
                                ),
                                alignment: Alignment.center,
                                child: Text(ic, style: const TextStyle(fontSize: 18)),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 8),
                        CupertinoTextField(controller: _nameCtrl, placeholder: '菜名 *', decoration: BoxDecoration(border: Border.all(color: Colors.grey.withValues(alpha: 0.3)), borderRadius: BorderRadius.circular(4))),
                        const SizedBox(height: 8),
                        InkWell(
                          onTap: () => setState(() => _showCuisinePicker = true),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('菜系（点击切换）', style: TextStyle(fontSize: 10, color: Colors.grey)),
                                Text(_cuisine, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        CupertinoTextField(controller: _ingCtrl, maxLines: 2, placeholder: '配料（例：五花肉、葱、蒜）', decoration: BoxDecoration(border: Border.all(color: Colors.grey.withValues(alpha: 0.3)), borderRadius: BorderRadius.circular(4))),
                        const SizedBox(height: 8),
                        CupertinoTextField(controller: _seaCtrl, maxLines: 2, placeholder: '调味料（例：生抽、蚝油、白胡椒）', decoration: BoxDecoration(border: Border.all(color: Colors.grey.withValues(alpha: 0.3)), borderRadius: BorderRadius.circular(4))),
                        const SizedBox(height: 8),
                        CupertinoTextField(
                            controller: _stepsCtrl,
                            maxLines: 4,
                            placeholder: '制作步骤（每行一步）',
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
                              borderRadius: BorderRadius.circular(4),
                            )),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(child: TextButton(onPressed: widget.onDismiss, child: const Text('取消'))),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final n = _nameCtrl.text.trim();
                            if (n.isEmpty) {
                              widget.onToast('请输入菜名');
                              return;
                            }
                            final steps = _stepsCtrl.text.split('\n').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
                            widget.onSave(Dish(
                              id: 'u_${DateTime.now().millisecondsSinceEpoch}',
                              name: n,
                              cuisine: _cuisine.isEmpty ? '我的菜' : _cuisine,
                              icon: _icon,
                              ingredients: _ingCtrl.text,
                              seasonings: _seaCtrl.text,
                              steps: steps.isEmpty ? const <String>['自由发挥'] : steps,
                              custom: true,
                            ));
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2E9E5B), foregroundColor: Colors.white),
                          child: const Text('💾 录入', style: TextStyle(fontWeight: FontWeight.w900)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_showCuisinePicker)
          Stack(
            children: [
              GestureDetector(onTap: () => setState(() => _showCuisinePicker = false), child: Container(color: Colors.black54)),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: CupertinoTheme.of(context).brightness == Brightness.dark ? const Color(0xFF1E1E1E) : Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('选择菜系', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: widget.existingCuisines.map((c) {
                          final sel = _cuisine == c;
                          return InkWell(
                            onTap: () => setState(() {
                              _cuisine = c;
                              _showCuisinePicker = false;
                            }),
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: sel ? const Color(0xFFFF8A3D).withValues(alpha: 0.25) : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: sel ? const Color(0xFFFF8A3D) : Colors.grey.withValues(alpha: 0.3)),
                              ),
                              child: Text(c, style: const TextStyle(fontSize: 12)),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 8),
                      TextButton(onPressed: () => setState(() => _showCuisinePicker = false), child: const Text('关闭')),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

/// 管理我的菜弹窗
class _ManageDishesDialog extends StatelessWidget {
  const _ManageDishesDialog({required this.dishes, required this.onDelete, required this.onDismiss});
  final List<Dish> dishes;
  final ValueChanged<String> onDelete;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    return Stack(
      children: [
        GestureDetector(onTap: onDismiss, child: Container(color: Colors.black54)),
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            constraints: const BoxConstraints(maxHeight: 480),
            decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E1E1E) : Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 14, 16, 4),
                  child: Text('📚 我的菜品库', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
                ),
                Flexible(
                  child: dishes.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('还没有自录的菜品，点击上方「录入我的菜」添加吧～', style: TextStyle(fontSize: 13)),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.all(12),
                          shrinkWrap: true,
                          itemCount: dishes.length,
                          separatorBuilder: (_, __) => Divider(color: Colors.grey.withValues(alpha: 0.18)),
                          itemBuilder: (_, i) {
                            final d = dishes[i];
                            return Row(
                              children: [
                                Text(d.icon, style: const TextStyle(fontSize: 18)),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(d.name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                                      Text('${d.cuisine} · 配料 ${d.ingredients.length > 10 ? '${d.ingredients.substring(0, 10)}…' : d.ingredients}',
                                          style: TextStyle(fontSize: 10, color: pal.secondary)),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete, color: Color(0xFFE23A3A)),
                                  onPressed: () => onDelete(d.id),
                                ),
                              ],
                            );
                          },
                        ),
                ),
                TextButton(onPressed: onDismiss, child: const Text('关闭')),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
