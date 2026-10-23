import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';
import 'package:jicun/lzdz/toast.dart';

class PlateCity {
  final String name;
  final String letter;
  const PlateCity({required this.name, required this.letter});
}

class PlateProvince {
  final String short;
  final String name;
  final List<PlateCity> cities;
  const PlateProvince({required this.short, required this.name, required this.cities});
}

const List<PlateProvince> kPlateProvinces = <PlateProvince>[
  PlateProvince(
    short: '京',
    name: '北京',
    cities: <PlateCity>[
      PlateCity(name: '北京城区', letter: 'A'),
      PlateCity(name: '北京出租', letter: 'B'),
      PlateCity(name: '北京远郊', letter: 'G'),
      PlateCity(name: '北京警备', letter: 'C'),
    ],
  ),
  PlateProvince(
    short: '津',
    name: '天津',
    cities: <PlateCity>[
      PlateCity(name: '天津市区', letter: 'A'),
      PlateCity(name: '天津塘沽', letter: 'B'),
      PlateCity(name: '天津郊县', letter: 'C'),
      PlateCity(name: '天津公交', letter: 'D'),
    ],
  ),
  PlateProvince(
    short: '冀',
    name: '河北',
    cities: <PlateCity>[
      PlateCity(name: '石家庄', letter: 'A'),
      PlateCity(name: '唐山', letter: 'B'),
      PlateCity(name: '秦皇岛', letter: 'C'),
      PlateCity(name: '邯郸', letter: 'D'),
      PlateCity(name: '邢台', letter: 'E'),
      PlateCity(name: '保定', letter: 'F'),
      PlateCity(name: '张家口', letter: 'G'),
      PlateCity(name: '承德', letter: 'H'),
      PlateCity(name: '沧州', letter: 'J'),
      PlateCity(name: '廊坊', letter: 'R'),
      PlateCity(name: '衡水', letter: 'T'),
    ],
  ),
  PlateProvince(
    short: '晋',
    name: '山西',
    cities: <PlateCity>[
      PlateCity(name: '太原', letter: 'A'),
      PlateCity(name: '大同', letter: 'B'),
      PlateCity(name: '阳泉', letter: 'C'),
      PlateCity(name: '长治', letter: 'D'),
      PlateCity(name: '晋城', letter: 'E'),
      PlateCity(name: '朔州', letter: 'F'),
      PlateCity(name: '忻州', letter: 'H'),
      PlateCity(name: '吕梁', letter: 'J'),
      PlateCity(name: '晋中', letter: 'K'),
      PlateCity(name: '临汾', letter: 'L'),
      PlateCity(name: '运城', letter: 'M'),
    ],
  ),
  PlateProvince(
    short: '蒙',
    name: '内蒙古',
    cities: <PlateCity>[
      PlateCity(name: '呼和浩特', letter: 'A'),
      PlateCity(name: '包头', letter: 'B'),
      PlateCity(name: '乌海', letter: 'C'),
      PlateCity(name: '赤峰', letter: 'D'),
      PlateCity(name: '呼伦贝尔', letter: 'E'),
      PlateCity(name: '兴安盟', letter: 'F'),
      PlateCity(name: '通辽', letter: 'G'),
      PlateCity(name: '锡林郭勒', letter: 'H'),
      PlateCity(name: '乌兰察布', letter: 'J'),
      PlateCity(name: '鄂尔多斯', letter: 'K'),
      PlateCity(name: '巴彦淖尔', letter: 'L'),
      PlateCity(name: '阿拉善', letter: 'M'),
    ],
  ),
  PlateProvince(
    short: '辽',
    name: '辽宁',
    cities: <PlateCity>[
      PlateCity(name: '沈阳', letter: 'A'),
      PlateCity(name: '大连', letter: 'B'),
      PlateCity(name: '鞍山', letter: 'C'),
      PlateCity(name: '抚顺', letter: 'D'),
      PlateCity(name: '本溪', letter: 'E'),
      PlateCity(name: '丹东', letter: 'F'),
      PlateCity(name: '锦州', letter: 'G'),
      PlateCity(name: '营口', letter: 'H'),
      PlateCity(name: '阜新', letter: 'J'),
      PlateCity(name: '辽阳', letter: 'K'),
      PlateCity(name: '盘锦', letter: 'L'),
      PlateCity(name: '铁岭', letter: 'M'),
      PlateCity(name: '朝阳', letter: 'N'),
      PlateCity(name: '葫芦岛', letter: 'P'),
    ],
  ),
  PlateProvince(
    short: '吉',
    name: '吉林',
    cities: <PlateCity>[
      PlateCity(name: '长春', letter: 'A'),
      PlateCity(name: '吉林市', letter: 'B'),
      PlateCity(name: '四平', letter: 'C'),
      PlateCity(name: '辽源', letter: 'D'),
      PlateCity(name: '通化', letter: 'E'),
      PlateCity(name: '白山', letter: 'F'),
      PlateCity(name: '松原', letter: 'J'),
      PlateCity(name: '白城', letter: 'G'),
      PlateCity(name: '延边', letter: 'H'),
    ],
  ),
  PlateProvince(
    short: '黑',
    name: '黑龙江',
    cities: <PlateCity>[
      PlateCity(name: '哈尔滨', letter: 'A'),
      PlateCity(name: '齐齐哈尔', letter: 'B'),
      PlateCity(name: '牡丹江', letter: 'C'),
      PlateCity(name: '佳木斯', letter: 'D'),
      PlateCity(name: '大庆', letter: 'E'),
      PlateCity(name: '伊春', letter: 'F'),
      PlateCity(name: '鸡西', letter: 'G'),
      PlateCity(name: '鹤岗', letter: 'H'),
      PlateCity(name: '双鸭山', letter: 'J'),
      PlateCity(name: '七台河', letter: 'K'),
      PlateCity(name: '绥化', letter: 'M'),
      PlateCity(name: '黑河', letter: 'N'),
      PlateCity(name: '大兴安岭', letter: 'P'),
    ],
  ),
  PlateProvince(
    short: '沪',
    name: '上海',
    cities: <PlateCity>[
      PlateCity(name: '上海市区', letter: 'A'),
      PlateCity(name: '上海浦东', letter: 'B'),
      PlateCity(name: '上海远郊', letter: 'C'),
      PlateCity(name: '上海增号', letter: 'D'),
    ],
  ),
  PlateProvince(
    short: '苏',
    name: '江苏',
    cities: <PlateCity>[
      PlateCity(name: '南京', letter: 'A'),
      PlateCity(name: '无锡', letter: 'B'),
      PlateCity(name: '徐州', letter: 'C'),
      PlateCity(name: '常州', letter: 'D'),
      PlateCity(name: '苏州', letter: 'E'),
      PlateCity(name: '南通', letter: 'F'),
      PlateCity(name: '连云港', letter: 'G'),
      PlateCity(name: '淮安', letter: 'H'),
      PlateCity(name: '盐城', letter: 'J'),
      PlateCity(name: '扬州', letter: 'K'),
      PlateCity(name: '镇江', letter: 'L'),
      PlateCity(name: '泰州', letter: 'M'),
      PlateCity(name: '宿迁', letter: 'N'),
    ],
  ),
  PlateProvince(
    short: '浙',
    name: '浙江',
    cities: <PlateCity>[
      PlateCity(name: '杭州', letter: 'A'),
      PlateCity(name: '宁波', letter: 'B'),
      PlateCity(name: '温州', letter: 'C'),
      PlateCity(name: '绍兴', letter: 'D'),
      PlateCity(name: '湖州', letter: 'E'),
      PlateCity(name: '嘉兴', letter: 'F'),
      PlateCity(name: '金华', letter: 'G'),
      PlateCity(name: '衢州', letter: 'H'),
      PlateCity(name: '舟山', letter: 'L'),
      PlateCity(name: '台州', letter: 'J'),
      PlateCity(name: '丽水', letter: 'K'),
    ],
  ),
  PlateProvince(
    short: '皖',
    name: '安徽',
    cities: <PlateCity>[
      PlateCity(name: '合肥', letter: 'A'),
      PlateCity(name: '芜湖', letter: 'B'),
      PlateCity(name: '蚌埠', letter: 'C'),
      PlateCity(name: '淮南', letter: 'D'),
      PlateCity(name: '马鞍山', letter: 'E'),
      PlateCity(name: '淮北', letter: 'F'),
      PlateCity(name: '铜陵', letter: 'G'),
      PlateCity(name: '安庆', letter: 'H'),
      PlateCity(name: '黄山', letter: 'J'),
      PlateCity(name: '阜阳', letter: 'K'),
      PlateCity(name: '宿州', letter: 'L'),
      PlateCity(name: '滁州', letter: 'M'),
      PlateCity(name: '六安', letter: 'N'),
      PlateCity(name: '宣城', letter: 'P'),
      PlateCity(name: '池州', letter: 'R'),
      PlateCity(name: '亳州', letter: 'S'),
    ],
  ),
  PlateProvince(
    short: '闽',
    name: '福建',
    cities: <PlateCity>[
      PlateCity(name: '福州', letter: 'A'),
      PlateCity(name: '莆田', letter: 'B'),
      PlateCity(name: '泉州', letter: 'C'),
      PlateCity(name: '厦门', letter: 'D'),
      PlateCity(name: '漳州', letter: 'E'),
      PlateCity(name: '龙岩', letter: 'F'),
      PlateCity(name: '三明', letter: 'G'),
      PlateCity(name: '南平', letter: 'H'),
      PlateCity(name: '宁德', letter: 'J'),
    ],
  ),
  PlateProvince(
    short: '赣',
    name: '江西',
    cities: <PlateCity>[
      PlateCity(name: '南昌', letter: 'A'),
      PlateCity(name: '赣州', letter: 'B'),
      PlateCity(name: '宜春', letter: 'C'),
      PlateCity(name: '吉安', letter: 'D'),
      PlateCity(name: '上饶', letter: 'E'),
      PlateCity(name: '抚州', letter: 'F'),
      PlateCity(name: '九江', letter: 'G'),
      PlateCity(name: '景德镇', letter: 'H'),
      PlateCity(name: '萍乡', letter: 'J'),
      PlateCity(name: '新余', letter: 'K'),
      PlateCity(name: '鹰潭', letter: 'L'),
    ],
  ),
  PlateProvince(
    short: '鲁',
    name: '山东',
    cities: <PlateCity>[
      PlateCity(name: '济南', letter: 'A'),
      PlateCity(name: '青岛', letter: 'B'),
      PlateCity(name: '淄博', letter: 'C'),
      PlateCity(name: '枣庄', letter: 'D'),
      PlateCity(name: '东营', letter: 'E'),
      PlateCity(name: '烟台', letter: 'F'),
      PlateCity(name: '潍坊', letter: 'G'),
      PlateCity(name: '济宁', letter: 'H'),
      PlateCity(name: '泰安', letter: 'J'),
      PlateCity(name: '威海', letter: 'K'),
      PlateCity(name: '日照', letter: 'L'),
      PlateCity(name: '滨州', letter: 'M'),
      PlateCity(name: '德州', letter: 'N'),
      PlateCity(name: '聊城', letter: 'P'),
      PlateCity(name: '临沂', letter: 'Q'),
      PlateCity(name: '菏泽', letter: 'R'),
    ],
  ),
  PlateProvince(
    short: '豫',
    name: '河南',
    cities: <PlateCity>[
      PlateCity(name: '郑州', letter: 'A'),
      PlateCity(name: '开封', letter: 'B'),
      PlateCity(name: '洛阳', letter: 'C'),
      PlateCity(name: '平顶山', letter: 'D'),
      PlateCity(name: '安阳', letter: 'E'),
      PlateCity(name: '鹤壁', letter: 'F'),
      PlateCity(name: '新乡', letter: 'G'),
      PlateCity(name: '焦作', letter: 'H'),
      PlateCity(name: '濮阳', letter: 'J'),
      PlateCity(name: '许昌', letter: 'K'),
      PlateCity(name: '漯河', letter: 'L'),
      PlateCity(name: '三门峡', letter: 'M'),
      PlateCity(name: '商丘', letter: 'N'),
      PlateCity(name: '周口', letter: 'P'),
      PlateCity(name: '驻马店', letter: 'Q'),
      PlateCity(name: '南阳', letter: 'R'),
      PlateCity(name: '信阳', letter: 'S'),
      PlateCity(name: '济源', letter: 'U'),
    ],
  ),
  PlateProvince(
    short: '鄂',
    name: '湖北',
    cities: <PlateCity>[
      PlateCity(name: '武汉', letter: 'A'),
      PlateCity(name: '黄石', letter: 'B'),
      PlateCity(name: '十堰', letter: 'C'),
      PlateCity(name: '宜昌', letter: 'E'),
      PlateCity(name: '襄阳', letter: 'F'),
      PlateCity(name: '鄂州', letter: 'G'),
      PlateCity(name: '荆门', letter: 'H'),
      PlateCity(name: '孝感', letter: 'K'),
      PlateCity(name: '荆州', letter: 'D'),
      PlateCity(name: '黄冈', letter: 'J'),
      PlateCity(name: '咸宁', letter: 'L'),
      PlateCity(name: '随州', letter: 'S'),
      PlateCity(name: '恩施', letter: 'Q'),
      PlateCity(name: '仙桃', letter: 'M'),
      PlateCity(name: '潜江', letter: 'N'),
      PlateCity(name: '天门', letter: 'R'),
    ],
  ),
  PlateProvince(
    short: '湘',
    name: '湖南',
    cities: <PlateCity>[
      PlateCity(name: '长沙', letter: 'A'),
      PlateCity(name: '株洲', letter: 'B'),
      PlateCity(name: '湘潭', letter: 'C'),
      PlateCity(name: '衡阳', letter: 'D'),
      PlateCity(name: '邵阳', letter: 'E'),
      PlateCity(name: '岳阳', letter: 'F'),
      PlateCity(name: '常德', letter: 'J'),
      PlateCity(name: '张家界', letter: 'G'),
      PlateCity(name: '益阳', letter: 'H'),
      PlateCity(name: '郴州', letter: 'L'),
      PlateCity(name: '永州', letter: 'M'),
      PlateCity(name: '怀化', letter: 'N'),
      PlateCity(name: '娄底', letter: 'K'),
      PlateCity(name: '湘西', letter: 'U'),
    ],
  ),
  PlateProvince(
    short: '粤',
    name: '广东',
    cities: <PlateCity>[
      PlateCity(name: '广州', letter: 'A'),
      PlateCity(name: '深圳', letter: 'B'),
      PlateCity(name: '珠海', letter: 'C'),
      PlateCity(name: '汕头', letter: 'D'),
      PlateCity(name: '佛山', letter: 'E'),
      PlateCity(name: '韶关', letter: 'F'),
      PlateCity(name: '湛江', letter: 'G'),
      PlateCity(name: '肇庆', letter: 'H'),
      PlateCity(name: '江门', letter: 'J'),
      PlateCity(name: '茂名', letter: 'K'),
      PlateCity(name: '惠州', letter: 'L'),
      PlateCity(name: '梅州', letter: 'M'),
      PlateCity(name: '汕尾', letter: 'N'),
      PlateCity(name: '河源', letter: 'P'),
      PlateCity(name: '阳江', letter: 'Q'),
      PlateCity(name: '清远', letter: 'R'),
      PlateCity(name: '东莞', letter: 'S'),
      PlateCity(name: '中山', letter: 'T'),
      PlateCity(name: '潮州', letter: 'U'),
      PlateCity(name: '揭阳', letter: 'V'),
      PlateCity(name: '云浮', letter: 'W'),
    ],
  ),
  PlateProvince(
    short: '桂',
    name: '广西',
    cities: <PlateCity>[
      PlateCity(name: '南宁', letter: 'A'),
      PlateCity(name: '柳州', letter: 'B'),
      PlateCity(name: '桂林', letter: 'C'),
      PlateCity(name: '梧州', letter: 'D'),
      PlateCity(name: '北海', letter: 'E'),
      PlateCity(name: '崇左', letter: 'F'),
      PlateCity(name: '来宾', letter: 'G'),
      PlateCity(name: '贺州', letter: 'J'),
      PlateCity(name: '玉林', letter: 'K'),
      PlateCity(name: '百色', letter: 'L'),
      PlateCity(name: '河池', letter: 'M'),
      PlateCity(name: '钦州', letter: 'N'),
      PlateCity(name: '防城港', letter: 'P'),
      PlateCity(name: '贵港', letter: 'R'),
    ],
  ),
  PlateProvince(
    short: '琼',
    name: '海南',
    cities: <PlateCity>[
      PlateCity(name: '海口', letter: 'A'),
      PlateCity(name: '三亚', letter: 'B'),
      PlateCity(name: '三沙', letter: 'C'),
      PlateCity(name: '琼海', letter: 'C'),
      PlateCity(name: '儋州', letter: 'F'),
    ],
  ),
  PlateProvince(
    short: '渝',
    name: '重庆',
    cities: <PlateCity>[
      PlateCity(name: '重庆主城', letter: 'A'),
      PlateCity(name: '重庆江北', letter: 'B'),
      PlateCity(name: '重庆永川', letter: 'C'),
      PlateCity(name: '重庆万州', letter: 'F'),
    ],
  ),
  PlateProvince(
    short: '川',
    name: '四川',
    cities: <PlateCity>[
      PlateCity(name: '成都', letter: 'A'),
      PlateCity(name: '绵阳', letter: 'B'),
      PlateCity(name: '自贡', letter: 'C'),
      PlateCity(name: '攀枝花', letter: 'D'),
      PlateCity(name: '泸州', letter: 'E'),
      PlateCity(name: '德阳', letter: 'F'),
      PlateCity(name: '广元', letter: 'H'),
      PlateCity(name: '遂宁', letter: 'J'),
      PlateCity(name: '内江', letter: 'K'),
      PlateCity(name: '乐山', letter: 'L'),
      PlateCity(name: '资阳', letter: 'M'),
      PlateCity(name: '宜宾', letter: 'Q'),
      PlateCity(name: '南充', letter: 'R'),
      PlateCity(name: '达州', letter: 'S'),
      PlateCity(name: '雅安', letter: 'T'),
      PlateCity(name: '阿坝', letter: 'U'),
      PlateCity(name: '甘孜', letter: 'V'),
      PlateCity(name: '凉山', letter: 'W'),
      PlateCity(name: '广安', letter: 'X'),
      PlateCity(name: '巴中', letter: 'Y'),
      PlateCity(name: '眉山', letter: 'Z'),
    ],
  ),
  PlateProvince(
    short: '贵',
    name: '贵州',
    cities: <PlateCity>[
      PlateCity(name: '贵阳', letter: 'A'),
      PlateCity(name: '六盘水', letter: 'B'),
      PlateCity(name: '遵义', letter: 'C'),
      PlateCity(name: '铜仁', letter: 'D'),
      PlateCity(name: '黔西南', letter: 'E'),
      PlateCity(name: '毕节', letter: 'F'),
      PlateCity(name: '安顺', letter: 'G'),
      PlateCity(name: '黔东南', letter: 'H'),
      PlateCity(name: '黔南', letter: 'J'),
    ],
  ),
  PlateProvince(
    short: '云',
    name: '云南',
    cities: <PlateCity>[
      PlateCity(name: '昆明', letter: 'A'),
      PlateCity(name: '昭通', letter: 'C'),
      PlateCity(name: '曲靖', letter: 'D'),
      PlateCity(name: '楚雄', letter: 'E'),
      PlateCity(name: '玉溪', letter: 'F'),
      PlateCity(name: '红河', letter: 'G'),
      PlateCity(name: '文山', letter: 'H'),
      PlateCity(name: '普洱', letter: 'J'),
      PlateCity(name: '西双版纳', letter: 'K'),
      PlateCity(name: '大理', letter: 'L'),
      PlateCity(name: '保山', letter: 'M'),
      PlateCity(name: '德宏', letter: 'N'),
      PlateCity(name: '丽江', letter: 'P'),
      PlateCity(name: '怒江', letter: 'Q'),
      PlateCity(name: '迪庆', letter: 'R'),
      PlateCity(name: '临沧', letter: 'S'),
    ],
  ),
  PlateProvince(
    short: '藏',
    name: '西藏',
    cities: <PlateCity>[
      PlateCity(name: '拉萨', letter: 'A'),
      PlateCity(name: '昌都', letter: 'B'),
      PlateCity(name: '山南', letter: 'C'),
      PlateCity(name: '日喀则', letter: 'D'),
      PlateCity(name: '那曲', letter: 'E'),
      PlateCity(name: '阿里', letter: 'F'),
      PlateCity(name: '林芝', letter: 'G'),
    ],
  ),
  PlateProvince(
    short: '陕',
    name: '陕西',
    cities: <PlateCity>[
      PlateCity(name: '西安', letter: 'A'),
      PlateCity(name: '铜川', letter: 'B'),
      PlateCity(name: '宝鸡', letter: 'C'),
      PlateCity(name: '咸阳', letter: 'D'),
      PlateCity(name: '渭南', letter: 'E'),
      PlateCity(name: '汉中', letter: 'F'),
      PlateCity(name: '安康', letter: 'G'),
      PlateCity(name: '商洛', letter: 'H'),
      PlateCity(name: '延安', letter: 'J'),
      PlateCity(name: '榆林', letter: 'K'),
      PlateCity(name: '杨凌', letter: 'V'),
    ],
  ),
  PlateProvince(
    short: '甘',
    name: '甘肃',
    cities: <PlateCity>[
      PlateCity(name: '兰州', letter: 'A'),
      PlateCity(name: '嘉峪关', letter: 'B'),
      PlateCity(name: '金昌', letter: 'C'),
      PlateCity(name: '白银', letter: 'D'),
      PlateCity(name: '天水', letter: 'E'),
      PlateCity(name: '酒泉', letter: 'F'),
      PlateCity(name: '张掖', letter: 'G'),
      PlateCity(name: '武威', letter: 'H'),
      PlateCity(name: '定西', letter: 'J'),
      PlateCity(name: '陇南', letter: 'K'),
      PlateCity(name: '平凉', letter: 'L'),
      PlateCity(name: '庆阳', letter: 'M'),
      PlateCity(name: '临夏', letter: 'N'),
      PlateCity(name: '甘南', letter: 'P'),
    ],
  ),
  PlateProvince(
    short: '青',
    name: '青海',
    cities: <PlateCity>[
      PlateCity(name: '西宁', letter: 'A'),
      PlateCity(name: '海东', letter: 'B'),
      PlateCity(name: '海北', letter: 'C'),
      PlateCity(name: '黄南', letter: 'D'),
      PlateCity(name: '海南州', letter: 'E'),
      PlateCity(name: '果洛', letter: 'F'),
      PlateCity(name: '玉树', letter: 'G'),
      PlateCity(name: '海西', letter: 'H'),
    ],
  ),
  PlateProvince(
    short: '宁',
    name: '宁夏',
    cities: <PlateCity>[
      PlateCity(name: '银川', letter: 'A'),
      PlateCity(name: '石嘴山', letter: 'B'),
      PlateCity(name: '吴忠', letter: 'C'),
      PlateCity(name: '固原', letter: 'D'),
      PlateCity(name: '中卫', letter: 'E'),
    ],
  ),
  PlateProvince(
    short: '新',
    name: '新疆',
    cities: <PlateCity>[
      PlateCity(name: '乌鲁木齐', letter: 'A'),
      PlateCity(name: '昌吉', letter: 'B'),
      PlateCity(name: '石河子', letter: 'C'),
      PlateCity(name: '奎屯', letter: 'D'),
      PlateCity(name: '博尔塔拉', letter: 'E'),
      PlateCity(name: '伊犁', letter: 'F'),
      PlateCity(name: '塔城', letter: 'G'),
      PlateCity(name: '阿勒泰', letter: 'H'),
      PlateCity(name: '克拉玛依', letter: 'J'),
      PlateCity(name: '吐鲁番', letter: 'K'),
      PlateCity(name: '哈密', letter: 'L'),
      PlateCity(name: '巴音郭楞', letter: 'M'),
      PlateCity(name: '阿克苏', letter: 'N'),
      PlateCity(name: '克孜勒苏', letter: 'P'),
      PlateCity(name: '喀什', letter: 'Q'),
      PlateCity(name: '和田', letter: 'R'),
    ],
  ),
  PlateProvince(
    short: '港',
    name: '香港',
    cities: <PlateCity>[
      PlateCity(name: '香港', letter: 'Z'),
    ],
  ),
  PlateProvince(
    short: '澳',
    name: '澳门',
    cities: <PlateCity>[
      PlateCity(name: '澳门', letter: 'Z'),
    ],
  ),
  PlateProvince(
    short: '台',
    name: '台湾',
    cities: <PlateCity>[
      PlateCity(name: '台北', letter: 'A'),
      PlateCity(name: '高雄', letter: 'B'),
      PlateCity(name: '台中', letter: 'C'),
      PlateCity(name: '台南', letter: 'D'),
    ],
  ),
];

/// 车牌摇号：全国 34 省级行政区及全部地级市/自治州选号
///
/// 移植自懒得找了 LicensePlateSection.kt：
/// - 身份（个人/单位）、省份（34 个）、城市（当前省辖下全部，支持跨省搜索）
/// - 类型：燃油蓝牌（7 位）/ 新能源绿牌（8 位），号牌池 10 选 1
/// - 号牌生成规则与源码一致（燃油：前缀+1 位非 0/1 字母数字+4 位数字；
///   新能源：前缀+D/F+5 位字母数字）
/// - 点击池内号牌直接选定；开始摇号 28 轮滚动后从池中摇出 1 个
class LicensePlateToolPage extends StatefulWidget {
  const LicensePlateToolPage({super.key});
  static const String pageTitle = '车牌摇号';

  @override
  State<LicensePlateToolPage> createState() => _LicensePlateToolPageState();
}

const String _blueChars = '0123456789ABCDEFGHJKLMNPQRSTUVWXYZ';

String _genPlate(String province, String cityLetter, bool isNewEnergy, Random rnd) {
  final prefix = province + cityLetter;
  if (isNewEnergy) {
    final second = rnd.nextBool() ? 'D' : 'F';
    final rest = StringBuffer();
    for (var i = 0; i < 5; i++) {
      rest.write(_blueChars[rnd.nextInt(_blueChars.length)]);
    }
    return prefix + second + rest.toString();
  }
  final first = _blueChars[2 + rnd.nextInt(_blueChars.length - 2)];
  final rest = StringBuffer();
  for (var i = 0; i < 4; i++) {
    rest.write(_blueChars[rnd.nextInt(10)]);
  }
  return prefix + first + rest.toString();
}

class _LicensePlateToolPageState extends State<LicensePlateToolPage> {
  final Random _rnd = Random();
  bool _isUnit = false;
  bool _isNewEnergy = false;
  int _provinceIdx = 18; // 默认粤（广东）
  int _cityIdx = 0; // 默认广州
  List<String> _pool = <String>[];
  bool _rolling = false;
  String _rollingPlate = '';
  String? _finalPlate;

  @override
  void initState() {
    super.initState();
    _regeneratePool();
  }

  PlateProvince get _province => kPlateProvinces[_provinceIdx.clamp(0, kPlateProvinces.length - 1)];
  PlateCity get _city => _province.cities[_cityIdx.clamp(0, _province.cities.length - 1)];

  void _regeneratePool({int? provIdx, int? cityIdx, bool? newEnergy}) {
    final p = provIdx ?? _provinceIdx;
    final c = cityIdx ?? _cityIdx;
    final ne = newEnergy ?? _isNewEnergy;
    final prov = kPlateProvinces[p.clamp(0, kPlateProvinces.length - 1)];
    final city = prov.cities[c.clamp(0, prov.cities.length - 1)];
    setState(() {
      _pool = List<String>.generate(10, (_) => _genPlate(prov.short, city.letter, ne, _rnd));
    });
  }

  void _selectProvince(int idx) {
    setState(() {
      _provinceIdx = idx;
      _cityIdx = 0;
    });
    _regeneratePool(provIdx: idx, cityIdx: 0);
  }

  void _selectCity(int provIdx, int cityIdx) {
    setState(() {
      _provinceIdx = provIdx;
      _cityIdx = cityIdx;
    });
    _regeneratePool(provIdx: provIdx, cityIdx: cityIdx);
  }

  Future<void> _startRoll() async {
    if (_rolling) return;
    setState(() {
      _rolling = true;
      _finalPlate = null;
    });
    final prov = _province;
    final city = _city;
    for (var i = 0; i < 28; i++) {
      if (!mounted) return;
      setState(() => _rollingPlate = _genPlate(prov.short, city.letter, _isNewEnergy, _rnd));
      final delayMs = i < 20 ? 70 : 70 + (i - 20) * 60;
      await Future.delayed(Duration(milliseconds: delayMs));
    }
    if (!mounted) return;
    final pool = _pool.isEmpty
        ? List<String>.generate(10, (_) => _genPlate(prov.short, city.letter, _isNewEnergy, _rnd))
        : _pool;
    final picked = pool[_rnd.nextInt(pool.length)];
    setState(() {
      _finalPlate = picked;
      _rollingPlate = picked;
      _rolling = false;
    });
    _toast('🎉 摇中号牌：$picked');
  }

  void _pickPlate(String p) {
    setState(() {
      _finalPlate = p;
      _rollingPlate = p;
    });
    _toast('已选定号牌：$p');
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
    const red = Color(0xFFDE2910);
    const labelColor = Color(0xFF7A4A45);

    return SubPage(
      title: LicensePlateToolPage.pageTitle,
      child: SafeArea(
        child: TopFadeListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            // 标题卡
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('🚘 车牌摇号 · 全国城市',
                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: red)),
                    const SizedBox(height: 2),
                    Text('全国 34 省级行政区 · 300+ 地级市联动 · 号牌池一键摇号',
                        style: TextStyle(fontSize: 11, color: pal.secondary)),
                  ],
                ),
              ),
            ),
            // 1. 身份
            Text('身份', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: pal.secondary)),
            _selectRow(
              context,
              title: _isUnit ? '🏢 单位车辆' : '👤 个人车辆',
              subtitle: _isUnit ? '机关事业单位 / 企业法人车辆' : '居民非营运小型客车',
              badge: _isUnit ? '公户' : '私家车',
              onTap: () => _showOptionDialog(
                context,
                title: '选择身份',
                options: const [
                  _Opt(false, '👤 个人车辆', '居民非营运小型客车', '私家车'),
                  _Opt(true, '🏢 单位车辆', '机关事业单位 / 企业法人车辆', '公户'),
                ],
                selected: _isUnit,
                onPick: (v) {
                  setState(() => _isUnit = v as bool);
                  _regeneratePool();
                },
              ),
            ),
            // 2. 省份
            Text('省份', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: pal.secondary)),
            _selectRow(
              context,
              title: '${_province.name}（简称：${_province.short}）',
              subtitle: '含 ${_province.cities.length} 个地级市 · 机关代号 ${_province.short}',
              badge: _province.short,
              onTap: () => _showProvinceDialog(context),
            ),
            // 3. 城市
            Text('城市', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: pal.secondary)),
            _selectRow(
              context,
              title: '${_city.name} (${_province.short}${_city.letter})',
              subtitle: '发牌机关代号 ${_province.short}${_city.letter}',
              badge: '${_province.short}${_city.letter}',
              onTap: () => _showCityDialog(context),
            ),
            // 4. 类型
            Text('类型', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: pal.secondary)),
            _selectRow(
              context,
              title: _isNewEnergy ? '🟢 新能源绿牌（8位渐变绿）' : '🔵 燃油蓝牌（7位标准号牌）',
              subtitle: _isNewEnergy ? '纯电 EV / 插电混动 PHEV 专属' : '常规燃油车及传统能源客车',
              badge: _isNewEnergy ? '8位' : '7位',
              onTap: () => _showOptionDialog(
                context,
                title: '选择号牌类型',
                options: const [
                  _Opt(false, '🔵 燃油蓝牌（7位标准号牌）', '常规燃油车及传统能源客车', '7位'),
                  _Opt(true, '🟢 新能源绿牌（8位渐变绿）', '纯电 EV / 插电混动 PHEV 专属', '8位'),
                ],
                selected: _isNewEnergy,
                onPick: (v) {
                  setState(() => _isNewEnergy = v as bool);
                  _regeneratePool(newEnergy: v as bool);
                },
              ),
            ),
            // 号牌池
            Row(
              children: [
                Expanded(
                  child: Text('号牌池（${_province.short}${_city.letter} · 10 选 1）',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: Color(0xFF3B1F1F))),
                ),
                TextButton(
                  onPressed: () => _regeneratePool(),
                  child: const Text('刷新号牌池', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: red)),
                ),
              ],
            ),
            for (var r = 0; r < (_pool.length / 2).ceil(); r++)
              Row(
                children: [
                  for (var c = 0; c < 2; c++)
                    if (r * 2 + c < _pool.length)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: c == 0 ? 8.0 : 0.0),
                          child: _plateChip(context, _pool[r * 2 + c]),
                        ),
                      )
                    else
                      const Expanded(child: SizedBox.shrink()),
                ],
              ),
            // 摇号结果展示
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: _isNewEnergy ? const Color(0xFF064E3B) : const Color(0xFF1E2A4A),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFFFD700), width: 2),
              ),
              child: Column(
                children: [
                  Text(
                    _rolling
                        ? (_rollingPlate.isEmpty ? '摇号中…' : _rollingPlate)
                        : (_finalPlate ?? '点击开始摇号'),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w900, color: Color(0xFFFFD700), letterSpacing: 3),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    (_finalPlate != null && !_rolling) ? '🎉 恭喜摇中（${_province.name}·${_city.name}）！' : '车牌摇号 · 好运加持',
                    style: const TextStyle(fontSize: 11, color: Color(0xFF9FB4E8)),
                  ),
                ],
              ),
            ),
            // 开始摇号
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _rolling ? null : _startRoll,
                icon: const Icon(Icons.directions_car),
                label: Text(_rolling ? '摇号中…' : '开始摇号',
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 15)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            Text('说明：已覆盖全国 34 个省级行政区与 300+ 地级市，摇号结果仅供参考娱乐，实际选号以当地车管所规定为准。',
                style: TextStyle(fontSize: 11, color: pal.secondary)),
          ],
        ),
      ),
    );
  }

  Widget _plateChip(BuildContext context, String plate) {
    final selected = _finalPlate == plate && !_rolling;
    final base = _isNewEnergy ? const Color(0xFF10B981) : const Color(0xFF3B82F6);
    final bg = _isNewEnergy ? const Color(0xFFECFDF5) : const Color(0xFFF3F7FF);
    final fg = _isNewEnergy ? const Color(0xFF047857) : const Color(0xFF1A4FA0);
    return InkWell(
      onTap: () => _pickPlate(plate),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: selected ? base : base.withValues(alpha: 0.35), width: selected ? 2.0 : 1.0),
        ),
        alignment: Alignment.center,
        child: Text(plate, style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.w900, color: fg)),
      ),
    );
  }

  Widget _selectRow(BuildContext context,
      {required String title, required String subtitle, required String badge, required VoidCallback onTap}) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: isDark ? 0.08 : 0.6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: pal.foreground)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: TextStyle(fontSize: 11, color: pal.secondary)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFDE2910).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(badge,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Color(0xFFDE2910))),
            ),
            const SizedBox(width: 6),
            Icon(Icons.arrow_drop_down, color: pal.secondary),
          ],
        ),
      ),
    );
  }

  void _showOptionDialog(BuildContext context,
      {required String title, required List<_Opt> options, required Object selected, required ValueChanged<Object> onPick}) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: options
              .map((o) => ListTile(
                    title: Text(o.title, style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold)),
                    subtitle: Text(o.subtitle, style: const TextStyle(fontSize: 11.5)),
                    trailing: o.id == selected ? const Icon(Icons.check, color: Color(0xFFDE2910)) : null,
                    onTap: () {
                      Navigator.of(ctx).pop();
                      onPick(o.id);
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }

  void _showProvinceDialog(BuildContext context) {
    final queryCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDlg) {
          final q = queryCtrl.text.trim();
          final filtered = <int>[];
          for (var i = 0; i < kPlateProvinces.length; i++) {
            final p = kPlateProvinces[i];
            if (q.isEmpty ||
                p.short.contains(q) ||
                p.name.contains(q) ||
                p.cities.any((c) => c.name.contains(q))) {
              filtered.add(i);
            }
          }
          return AlertDialog(
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('选择省份（全国 34 省级行政区）', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFFDE2910))),
                Text('点击任意省份自动切换对应城市列表', style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            content: SizedBox(
              width: double.maxFinite,
              height: 420,
              child: Column(
                children: [
                  CupertinoTextField(
                    controller: queryCtrl,
                    onChanged: (_) => setDlg(() {}),
                    placeholder: '搜索省份名或简称（如：广东 / 粤 / 浙江）',
                    placeholderStyle: const TextStyle(fontSize: 12),
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.search, size: 18),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.withValues(alpha: 0.3)),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (_, i) {
                        final idx = filtered[i];
                        final p = kPlateProvinces[idx];
                        final sel = idx == _provinceIdx;
                        return InkWell(
                          onTap: () {
                            Navigator.of(ctx).pop();
                            _selectProvince(idx);
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                            margin: const EdgeInsets.only(bottom: 6),
                            decoration: BoxDecoration(
                              color: sel ? const Color(0xFFFFF1F0) : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: sel ? const Color(0xFFDE2910) : Colors.grey.withValues(alpha: 0.25)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFDE2910), borderRadius: BorderRadius.circular(8)),
                                  child: Text(p.short,
                                      style: const TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w900, color: Colors.white)),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(p.name,
                                      style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold)),
                                ),
                                Text('${p.cities.length} 个城市', style: const TextStyle(fontSize: 11.5, color: Colors.grey)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: [TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('关闭'))],
          );
        },
      ),
    ).then((_) => queryCtrl.dispose());
  }

  void _showCityDialog(BuildContext context) {
    final queryCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDlg) {
          final q = queryCtrl.text.trim();
          final opts = <({int provIdx, int cityIdx})>[];
          if (q.isEmpty) {
            final p = kPlateProvinces[_provinceIdx];
            for (var i = 0; i < p.cities.length; i++) {
              opts.add((provIdx: _provinceIdx, cityIdx: i));
            }
          } else {
            for (var pi = 0; pi < kPlateProvinces.length; pi++) {
              final p = kPlateProvinces[pi];
              for (var ci = 0; ci < p.cities.length; ci++) {
                final c = p.cities[ci];
                final code = '${p.short}${c.letter}';
                if (c.name.contains(q) || p.name.contains(q) || code.contains(q)) {
                  opts.add((provIdx: pi, cityIdx: ci));
                }
              }
            }
          }
          return AlertDialog(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('选择城市（${kPlateProvinces[_provinceIdx].name} · 可搜全国）',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Color(0xFFDE2910))),
                const Text('支持直接输入全国任意城市名或车牌前缀（如：深圳 / 苏E）',
                    style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
            content: SizedBox(
              width: double.maxFinite,
              height: 420,
              child: Column(
                children: [
                  CupertinoTextField(
                    controller: queryCtrl,
                    onChanged: (_) => setDlg(() {}),
                    placeholder: '输入全国任意城市名或代号（如：成都 / 粤B / 杭州）',
                    placeholderStyle: const TextStyle(fontSize: 12),
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.search, size: 18),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.withValues(alpha: 0.3)),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(12)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: opts.length,
                      itemBuilder: (_, i) {
                        final o = opts[i];
                        final p = kPlateProvinces[o.provIdx];
                        final c = p.cities[o.cityIdx];
                        final sel = o.provIdx == _provinceIdx && o.cityIdx == _cityIdx;
                        return InkWell(
                          onTap: () {
                            Navigator.of(ctx).pop();
                            _selectCity(o.provIdx, o.cityIdx);
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                            margin: const EdgeInsets.only(bottom: 6),
                            decoration: BoxDecoration(
                              color: sel ? const Color(0xFFFFF1F0) : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: sel ? const Color(0xFFDE2910) : Colors.grey.withValues(alpha: 0.25)),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF1A4FA0), borderRadius: BorderRadius.circular(8)),
                                  child: Text('${p.short}${c.letter}',
                                      style: const TextStyle(
                                          fontSize: 13, fontWeight: FontWeight.w900, color: Colors.white)),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text('${p.name} · ${c.name}',
                                      style: const TextStyle(fontSize: 14.5, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: [TextButton(onPressed: () => Navigator.of(ctx).pop(), child: const Text('关闭'))],
          );
        },
      ),
    ).then((_) => queryCtrl.dispose());
  }
}

class _Opt {
  final Object id;
  final String title;
  final String subtitle;
  final String badge;
  const _Opt(this.id, this.title, this.subtitle, this.badge);
}
