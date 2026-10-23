import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jicun/lzdz/toast.dart';
import 'package:http/http.dart' as http;
import 'package:jicun/ui/glass.dart'; // GlassPanel, SubPage, TopFadeListView
import 'package:jicun/ui/palette.dart'; // Palette

class _CountryCurrency {
  const _CountryCurrency({
    required this.code,
    required this.country,
    required this.currencyName,
    required this.symbol,
    required this.flag,
    required this.continent,
    required this.defaultRateToUsd,
  });

  final String code;
  final String country;
  final String currencyName;
  final String symbol;
  final String flag;
  final String continent;
  final double defaultRateToUsd;

  String get displayLabel => '$flag $country · $currencyName $symbol ($code)';
}

/// 全球 83 个主流国家/地区货币（内置兜底汇率，兑美元）
const List<_CountryCurrency> _currencies = [
  // 亚洲
  _CountryCurrency(code: 'CNY', country: '中国', currencyName: '人民币', symbol: '¥', flag: '🇨🇳', continent: '亚洲', defaultRateToUsd: 7.18),
  _CountryCurrency(code: 'HKD', country: '中国香港', currencyName: '港币', symbol: 'HK\$', flag: '🇭🇰', continent: '亚洲', defaultRateToUsd: 7.80),
  _CountryCurrency(code: 'MOP', country: '中国澳门', currencyName: '澳门元', symbol: 'MOP\$', flag: '🇲🇴', continent: '亚洲', defaultRateToUsd: 8.03),
  _CountryCurrency(code: 'TWD', country: '中国台湾', currencyName: '新台币', symbol: 'NT\$', flag: '🇨🇳', continent: '亚洲', defaultRateToUsd: 32.10),
  _CountryCurrency(code: 'JPY', country: '日本', currencyName: '日元', symbol: '¥', flag: '🇯🇵', continent: '亚洲', defaultRateToUsd: 150.20),
  _CountryCurrency(code: 'KRW', country: '韩国', currencyName: '韩元', symbol: '₩', flag: '🇰🇷', continent: '亚洲', defaultRateToUsd: 1365.0),
  _CountryCurrency(code: 'SGD', country: '新加坡', currencyName: '新加坡元', symbol: 'S\$', flag: '🇸🇬', continent: '亚洲', defaultRateToUsd: 1.34),
  _CountryCurrency(code: 'MYR', country: '马来西亚', currencyName: '林吉特', symbol: 'RM', flag: '🇲🇾', continent: '亚洲', defaultRateToUsd: 4.42),
  _CountryCurrency(code: 'THB', country: '泰国', currencyName: '泰铢', symbol: '฿', flag: '🇹🇭', continent: '亚洲', defaultRateToUsd: 33.80),
  _CountryCurrency(code: 'VND', country: '越南', currencyName: '越南盾', symbol: '₫', flag: '🇻🇳', continent: '亚洲', defaultRateToUsd: 25200.0),
  _CountryCurrency(code: 'PHP', country: '菲律宾', currencyName: '比索', symbol: '₱', flag: '🇵🇭', continent: '亚洲', defaultRateToUsd: 57.60),
  _CountryCurrency(code: 'IDR', country: '印度尼西亚', currencyName: '印尼盾', symbol: 'Rp', flag: '🇮🇩', continent: '亚洲', defaultRateToUsd: 15850.0),
  _CountryCurrency(code: 'INR', country: '印度', currencyName: '卢比', symbol: '₹', flag: '🇮🇳', continent: '亚洲', defaultRateToUsd: 84.05),
  _CountryCurrency(code: 'PKR', country: '巴基斯坦', currencyName: '卢比', symbol: '₨', flag: '🇵🇰', continent: '亚洲', defaultRateToUsd: 278.5),
  _CountryCurrency(code: 'BDT', country: '孟加拉国', currencyName: '塔卡', symbol: '৳', flag: '🇧🇩', continent: '亚洲', defaultRateToUsd: 119.5),
  _CountryCurrency(code: 'LKR', country: '斯里兰卡', currencyName: '卢比', symbol: 'Rs', flag: '🇱🇰', continent: '亚洲', defaultRateToUsd: 293.0),
  _CountryCurrency(code: 'NPR', country: '尼泊尔', currencyName: '卢比', symbol: '₨', flag: '🇳🇵', continent: '亚洲', defaultRateToUsd: 134.5),
  _CountryCurrency(code: 'KHR', country: '柬埔寨', currencyName: '瑞尔', symbol: '៛', flag: '🇰🇭', continent: '亚洲', defaultRateToUsd: 4065.0),
  _CountryCurrency(code: 'LAK', country: '老挝', currencyName: '基普', symbol: '₭', flag: '🇱🇦', continent: '亚洲', defaultRateToUsd: 21900.0),
  _CountryCurrency(code: 'MMK', country: '缅甸', currencyName: '缅元', symbol: 'K', flag: '🇲🇲', continent: '亚洲', defaultRateToUsd: 2100.0),
  _CountryCurrency(code: 'BND', country: '文莱', currencyName: '文莱元', symbol: 'B\$', flag: '🇧🇳', continent: '亚洲', defaultRateToUsd: 1.34),
  _CountryCurrency(code: 'MNT', country: '蒙古', currencyName: '图格里克', symbol: '₮', flag: '🇲🇳', continent: '亚洲', defaultRateToUsd: 3400.0),
  _CountryCurrency(code: 'KZT', country: '哈萨克斯坦', currencyName: '坚戈', symbol: '₸', flag: '🇰🇿', continent: '亚洲', defaultRateToUsd: 488.0),
  _CountryCurrency(code: 'UZS', country: '乌兹别克斯坦', currencyName: '苏姆', symbol: "so'm", flag: '🇺🇿', continent: '亚洲', defaultRateToUsd: 12780.0),
  _CountryCurrency(code: 'AED', country: '阿联酋', currencyName: '迪拉姆', symbol: 'د.إ', flag: '🇦🇪', continent: '亚洲', defaultRateToUsd: 3.67),
  _CountryCurrency(code: 'SAR', country: '沙特阿拉伯', currencyName: '里亚尔', symbol: '﷼', flag: '🇸🇦', continent: '亚洲', defaultRateToUsd: 3.75),
  _CountryCurrency(code: 'QAR', country: '卡塔尔', currencyName: '里亚尔', symbol: '﷼', flag: '🇶🇦', continent: '亚洲', defaultRateToUsd: 3.64),
  _CountryCurrency(code: 'KWD', country: '科威特', currencyName: '第纳尔', symbol: 'د.ك', flag: '🇰🇼', continent: '亚洲', defaultRateToUsd: 0.307),
  _CountryCurrency(code: 'BHD', country: '巴林', currencyName: '第纳尔', symbol: 'د.ب', flag: '🇧🇭', continent: '亚洲', defaultRateToUsd: 0.377),
  _CountryCurrency(code: 'OMR', country: '阿曼', currencyName: '里亚尔', symbol: 'ر.ع', flag: '🇴🇲', continent: '亚洲', defaultRateToUsd: 0.385),
  _CountryCurrency(code: 'ILS', country: '以色列', currencyName: '谢克尔', symbol: '₪', flag: '🇮🇱', continent: '亚洲', defaultRateToUsd: 3.74),
  _CountryCurrency(code: 'TRY', country: '土耳其', currencyName: '里拉', symbol: '₺', flag: '🇹🇷', continent: '亚洲', defaultRateToUsd: 34.25),
  _CountryCurrency(code: 'JOD', country: '约旦', currencyName: '第纳尔', symbol: 'د.ا', flag: '🇯🇴', continent: '亚洲', defaultRateToUsd: 0.709),
  _CountryCurrency(code: 'IQD', country: '伊拉克', currencyName: '第纳尔', symbol: 'ع.د', flag: '🇮🇶', continent: '亚洲', defaultRateToUsd: 1310.0),
  _CountryCurrency(code: 'IRR', country: '伊朗', currencyName: '里亚尔', symbol: '﷼', flag: '🇮🇷', continent: '亚洲', defaultRateToUsd: 42000.0),
  // 美洲
  _CountryCurrency(code: 'USD', country: '美国', currencyName: '美元', symbol: '\$', flag: '🇺🇸', continent: '美洲', defaultRateToUsd: 1.0),
  _CountryCurrency(code: 'CAD', country: '加拿大', currencyName: '加元', symbol: 'C\$', flag: '🇨🇦', continent: '美洲', defaultRateToUsd: 1.38),
  _CountryCurrency(code: 'MXN', country: '墨西哥', currencyName: '比索', symbol: 'Mex\$', flag: '🇲🇽', continent: '美洲', defaultRateToUsd: 19.85),
  _CountryCurrency(code: 'BRL', country: '巴西', currencyName: '雷亚尔', symbol: 'R\$', flag: '🇧🇷', continent: '美洲', defaultRateToUsd: 5.70),
  _CountryCurrency(code: 'ARS', country: '阿根廷', currencyName: '比索', symbol: '\$', flag: '🇦🇷', continent: '美洲', defaultRateToUsd: 985.0),
  _CountryCurrency(code: 'CLP', country: '智利', currencyName: '比索', symbol: '\$', flag: '🇨🇱', continent: '美洲', defaultRateToUsd: 950.0),
  _CountryCurrency(code: 'COP', country: '哥伦比亚', currencyName: '比索', symbol: '\$', flag: '🇨🇴', continent: '美洲', defaultRateToUsd: 4350.0),
  _CountryCurrency(code: 'PEN', country: '秘鲁', currencyName: '索尔', symbol: 'S/', flag: '🇵🇪', continent: '美洲', defaultRateToUsd: 3.76),
  _CountryCurrency(code: 'UYU', country: '乌拉圭', currencyName: '比索', symbol: '\$U', flag: '🇺🇾', continent: '美洲', defaultRateToUsd: 41.6),
  _CountryCurrency(code: 'CRC', country: '哥斯达黎加', currencyName: '科朗', symbol: '₡', flag: '🇨🇷', continent: '美洲', defaultRateToUsd: 514.0),
  _CountryCurrency(code: 'DOP', country: '多米尼加', currencyName: '比索', symbol: 'RD\$', flag: '🇩🇴', continent: '美洲', defaultRateToUsd: 60.2),
  _CountryCurrency(code: 'JMD', country: '牙买加', currencyName: '牙买加元', symbol: 'J\$', flag: '🇯🇲', continent: '美洲', defaultRateToUsd: 158.0),
  // 欧洲
  _CountryCurrency(code: 'EUR', country: '欧盟(德/法/意/西等)', currencyName: '欧元', symbol: '€', flag: '🇪🇺', continent: '欧洲', defaultRateToUsd: 0.92),
  _CountryCurrency(code: 'GBP', country: '英国', currencyName: '英镑', symbol: '£', flag: '🇬🇧', continent: '欧洲', defaultRateToUsd: 0.77),
  _CountryCurrency(code: 'CHF', country: '瑞士', currencyName: '瑞士法郎', symbol: '₣', flag: '🇨🇭', continent: '欧洲', defaultRateToUsd: 0.865),
  _CountryCurrency(code: 'RUB', country: '俄罗斯', currencyName: '卢布', symbol: '₽', flag: '🇷🇺', continent: '欧洲', defaultRateToUsd: 96.5),
  _CountryCurrency(code: 'SEK', country: '瑞典', currencyName: '瑞典克朗', symbol: 'kr', flag: '🇸🇪', continent: '欧洲', defaultRateToUsd: 10.65),
  _CountryCurrency(code: 'NOK', country: '挪威', currencyName: '挪威克朗', symbol: 'kr', flag: '🇳🇴', continent: '欧洲', defaultRateToUsd: 10.95),
  _CountryCurrency(code: 'DKK', country: '丹麦', currencyName: '丹麦克朗', symbol: 'kr', flag: '🇩🇰', continent: '欧洲', defaultRateToUsd: 6.88),
  _CountryCurrency(code: 'PLN', country: '波兰', currencyName: '兹罗提', symbol: 'zł', flag: '🇵🇱', continent: '欧洲', defaultRateToUsd: 4.01),
  _CountryCurrency(code: 'CZK', country: '捷克', currencyName: '捷克克朗', symbol: 'Kč', flag: '🇨🇿', continent: '欧洲', defaultRateToUsd: 23.4),
  _CountryCurrency(code: 'HUF', country: '匈牙利', currencyName: '福林', symbol: 'Ft', flag: '🇭🇺', continent: '欧洲', defaultRateToUsd: 372.0),
  _CountryCurrency(code: 'RON', country: '罗马尼亚', currencyName: '列伊', symbol: 'lei', flag: '🇷🇴', continent: '欧洲', defaultRateToUsd: 4.58),
  _CountryCurrency(code: 'BGN', country: '保加利亚', currencyName: '列弗', symbol: 'лв', flag: '🇧🇬', continent: '欧洲', defaultRateToUsd: 1.80),
  _CountryCurrency(code: 'UAH', country: '乌克兰', currencyName: '格里夫纳', symbol: '₴', flag: '🇺🇦', continent: '欧洲', defaultRateToUsd: 41.3),
  _CountryCurrency(code: 'ISK', country: '冰岛', currencyName: '冰岛克朗', symbol: 'kr', flag: '🇮🇸', continent: '欧洲', defaultRateToUsd: 138.0),
  _CountryCurrency(code: 'RSD', country: '塞尔维亚', currencyName: '第纳尔', symbol: 'дин', flag: '🇷🇸', continent: '欧洲', defaultRateToUsd: 108.0),
  _CountryCurrency(code: 'BYN', country: '白俄罗斯', currencyName: '卢布', symbol: 'Br', flag: '🇧🇾', continent: '欧洲', defaultRateToUsd: 3.27),
  // 大洋洲
  _CountryCurrency(code: 'AUD', country: '澳大利亚', currencyName: '澳元', symbol: 'A\$', flag: '🇦🇺', continent: '大洋洲', defaultRateToUsd: 1.51),
  _CountryCurrency(code: 'NZD', country: '新西兰', currencyName: '新西兰元', symbol: 'NZ\$', flag: '🇳🇿', continent: '大洋洲', defaultRateToUsd: 1.66),
  _CountryCurrency(code: 'FJD', country: '斐济', currencyName: '斐济元', symbol: 'FJ\$', flag: '🇫🇯', continent: '大洋洲', defaultRateToUsd: 2.24),
  // 非洲
  _CountryCurrency(code: 'ZAR', country: '南非', currencyName: '兰特', symbol: 'R', flag: '🇿🇦', continent: '非洲', defaultRateToUsd: 17.65),
  _CountryCurrency(code: 'EGP', country: '埃及', currencyName: '埃及镑', symbol: 'E£', flag: '🇪🇬', continent: '非洲', defaultRateToUsd: 48.7),
  _CountryCurrency(code: 'NGN', country: '尼日利亚', currencyName: '奈拉', symbol: '₦', flag: '🇳🇬', continent: '非洲', defaultRateToUsd: 1640.0),
  _CountryCurrency(code: 'KES', country: '肯尼亚', currencyName: '先令', symbol: 'KSh', flag: '🇰🇪', continent: '非洲', defaultRateToUsd: 129.0),
  _CountryCurrency(code: 'MAD', country: '摩洛哥', currencyName: '迪拉姆', symbol: 'د.م', flag: '🇲🇦', continent: '非洲', defaultRateToUsd: 9.88),
  _CountryCurrency(code: 'GHS', country: '加纳', currencyName: '塞地', symbol: '₵', flag: '🇬🇭', continent: '非洲', defaultRateToUsd: 15.9),
  _CountryCurrency(code: 'TZS', country: '坦桑尼亚', currencyName: '先令', symbol: 'TSh', flag: '🇹🇿', continent: '非洲', defaultRateToUsd: 2720.0),
  _CountryCurrency(code: 'ETB', country: '埃塞俄比亚', currencyName: '比尔', symbol: 'Br', flag: '🇪🇹', continent: '非洲', defaultRateToUsd: 118.0),
  _CountryCurrency(code: 'DZD', country: '阿尔及利亚', currencyName: '第纳尔', symbol: 'د.ج', flag: '🇩🇿', continent: '非洲', defaultRateToUsd: 133.5),
  _CountryCurrency(code: 'TND', country: '突尼斯', currencyName: '第纳尔', symbol: 'د.ت', flag: '🇹🇳', continent: '非洲', defaultRateToUsd: 3.10),
];

/// 热门币种一键替换栏
const List<String> _quickCodes = [
  'CNY', 'USD', 'EUR', 'JPY', 'HKD', 'GBP', 'KRW', 'SGD', 'AUD', 'RUB',
];

const List<String> _continents = ['全部', '亚洲', '欧洲', '美洲', '大洋洲', '非洲'];

/// 数值格式化：>=100 保留 2 位，>=1 保留 4 位，否则 6 位，并去掉多余尾随 0
String _fmt(double v) {
  final scale = v >= 100 ? 2 : (v >= 1 ? 4 : 6);
  var s = v.toStringAsFixed(scale);
  if (s.contains('.')) {
    s = s.replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
  }
  return s;
}

_CountryCurrency _findCurrency(String code) {
  return _currencies.firstWhere((c) => c.code == code, orElse: () => _currencies[0]);
}

class CurrencyToolPage extends StatefulWidget {
  const CurrencyToolPage({super.key});
  static const String pageTitle = '货币转换';

  @override
  State<CurrencyToolPage> createState() => _CurrencyToolPageState();
}

class _CurrencyToolPageState extends State<CurrencyToolPage> {
  final TextEditingController _amountCtrl = TextEditingController(text: '1');
  String _fromCode = 'USD';
  String _toCode = 'CNY';
  Map<String, double> _rates = Map.unmodifiable(
      {for (final c in _currencies) c.code: c.defaultRateToUsd});
  bool _usingOnline = false;
  bool _loading = false;

  @override
  void dispose() {
    _amountCtrl.dispose();
    super.dispose();
  }

  String _convertResult() {
    final from = _findCurrency(_fromCode);
    final to = _findCurrency(_toCode);
    final amt = double.tryParse(_amountCtrl.text.trim());
    if (amt == null || amt <= 0) return '请输入有效金额';
    final fromRate = _rates[_fromCode] ?? 1.0;
    final toRate = _rates[_toCode] ?? 1.0;
    final value = amt / fromRate * toRate;
    return '${_amountCtrl.text.trim()} ${from.country}(${from.code}) = ${_fmt(value)} ${to.country}(${to.code})';
  }

  /// 同步在线实时汇率：open.er-api.com 失败后降级到 frankfurter，再失败用内置汇率
  Future<void> _fetchRates() async {
    if (_loading) return;
    setState(() => _loading = true);
    Map<String, double>? fetched;

    Future<Map<String, double>?> fetchOne(String url) async {
      try {
        final resp = await http
            .get(Uri.parse(url), headers: {'User-Agent': 'LazyFind'})
            .timeout(const Duration(seconds: 6));
        if (resp.statusCode != 200) return null;
        final body = json.decode(resp.body) as Map<String, dynamic>;
        final ratesObj = (body['rates'] as Map<String, dynamic>?) ?? {};
        final map = <String, double>{'USD': 1.0};
        ratesObj.forEach((k, v) {
          final d = (v as num?)?.toDouble();
          if (d != null && d > 0) map[k] = d;
        });
        if (map.length <= 1) return null;
        return map;
      } catch (_) {
        return null;
      }
    }

    fetched = await fetchOne('https://open.er-api.com/v6/latest/USD');
    fetched ??= await fetchOne('https://api.frankfurter.app/latest?from=USD');

    if (!mounted) return;
    if (fetched != null) {
      // 用内置汇率补齐在线源缺失的币种
      final merged = Map<String, double>.from(fetched);
      for (final c in _currencies) {
        merged.putIfAbsent(c.code, () => c.defaultRateToUsd);
      }
      setState(() {
        _rates = Map.unmodifiable(merged);
        _usingOnline = true;
        _loading = false;
      });
      _toast('✅ 已同步全球最新实时汇率');
    } else {
      setState(() => _loading = false);
      _toast('在线汇率获取受限，已启用内置全球汇率');
    }
  }

  void _toast(String msg) {
    if (!mounted) return;
    showLzToast(context, msg);
  }

  /// 全球国家/货币选择弹窗：支持搜索国家名/货币名/代码 + 五大洲分类筛选
  Future<void> _openPicker(bool isFrom) async {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    var search = '';
    var continent = '全部';
    final current = isFrom ? _fromCode : _toCode;

    await showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialog) {
          final q = search.trim().toLowerCase();
          final filtered = _currencies.where((item) {
            final matchContinent = continent == '全部' || item.continent == continent;
            final matchQuery = q.isEmpty ||
                item.country.toLowerCase().contains(q) ||
                item.currencyName.toLowerCase().contains(q) ||
                item.code.toLowerCase().contains(q) ||
                item.symbol.toLowerCase().contains(q);
            return matchContinent && matchQuery;
          }).toList();
          return AlertDialog(
            backgroundColor: isDark ? const Color(0xFF2A2A2C) : Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            title: Text(isFrom ? '选择源国家 / 货币' : '选择目标国家 / 货币',
                style: TextStyle(
                    color: pal.foreground,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            content: SizedBox(
              width: double.maxFinite,
              height: 440,
              child: Column(
                children: [
                  CupertinoTextField(
                    placeholder: '搜索国家名、货币名或代码（如：日本 / 欧元 / USD）',
                    placeholderStyle: TextStyle(
                        color: pal.secondary, fontSize: 12),
                    style:
                        TextStyle(color: pal.foreground, fontSize: 13),
                    prefix: const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(CupertinoIcons.search,
                            size: 16, color: Colors.grey)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                        color: pal.subtleFill,
                        borderRadius: BorderRadius.circular(10)),
                    onChanged: (v) => setDialog(() => search = v),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 32,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _continents.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: 6),
                      itemBuilder: (c, i) {
                        final cont = _continents[i];
                        final sel = continent == cont;
                        return GestureDetector(
                          onTap: () =>
                              setDialog(() => continent = cont),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12),
                            decoration: BoxDecoration(
                                color: sel
                                    ? pal.accent
                                    : pal.subtleFill,
                                borderRadius:
                                    BorderRadius.circular(16)),
                            child: Text(cont,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: sel
                                        ? Colors.white
                                        : pal.foreground)),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView.separated(
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(height: 6),
                      itemBuilder: (c, i) {
                        final item = filtered[i];
                        final sel = item.code == current;
                        return InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            setState(() {
                              if (isFrom) {
                                _fromCode = item.code;
                              } else {
                                _toCode = item.code;
                              }
                            });
                            Navigator.of(ctx).pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 10),
                            decoration: BoxDecoration(
                                color: sel
                                    ? pal.accentSoft
                                    : Colors.transparent,
                                borderRadius:
                                    BorderRadius.circular(12),
                                border: Border.all(
                                    color: sel
                                        ? pal.accent
                                        : pal.subtleFill)),
                            child: Row(
                              children: [
                                Text(item.flag,
                                    style: const TextStyle(
                                        fontSize: 22)),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          '${item.country} · ${item.currencyName}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight:
                                                  FontWeight.bold,
                                              color:
                                                  pal.foreground)),
                                      const SizedBox(height: 2),
                                      Text(
                                          '${item.continent} · 符号 ${item.symbol} · 代码 ${item.code}',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: pal.secondary)),
                                    ],
                                  ),
                                ),
                                Text(item.code,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: sel
                                            ? pal.accent
                                            : pal.secondary)),
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
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text('关闭'))
            ],
          );
        },
      ),
    );
  }

  Widget _pickerCard(_CountryCurrency item, bool isFrom, bool isDark,
      Palette pal, Color borderColor) {
    return GestureDetector(
      onTap: () => _openPicker(isFrom),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor.withOpacity(0.45)),
        ),
        child: Row(
          children: [
            Text(item.flag, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${item.country} · ${item.currencyName} (${item.symbol})',
                      style: TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w800,
                          color: pal.foreground)),
                  const SizedBox(height: 2),
                  Text('国际代码：${item.code} · 所属：${item.continent}（点击更换国家）',
                      style: TextStyle(
                          fontSize: 10.5, color: pal.secondary)),
                ],
              ),
            ),
            Icon(Icons.arrow_drop_down, color: borderColor, size: 24),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    final from = _findCurrency(_fromCode);
    final to = _findCurrency(_toCode);
    const green = Color(0xFF00875A);

    final amt = double.tryParse(_amountCtrl.text.trim());
    final unitRate =
        1.0 / ((_rates[_fromCode] ?? 1.0)) * ((_rates[_toCode] ?? 1.0));

    return SubPage(
      title: CurrencyToolPage.pageTitle,
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
                    Text('🌍 全球国家货币转换',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            color: pal.foreground)),
                    const SizedBox(height: 2),
                    Text('支持全球国家/地区自由选择与一键替换 · 实时汇率双向换算',
                        style: TextStyle(
                            fontSize: 11, color: pal.secondary)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 金额输入
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: CupertinoTextField(
                  controller: _amountCtrl,
                  keyboardType: const TextInputType.numberWithOptions(
                      decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  style:
                      TextStyle(color: pal.foreground, fontSize: 16),
                  placeholder: '金额',
                  placeholderStyle:
                      TextStyle(color: pal.secondary, fontSize: 16),
                  decoration: const BoxDecoration(),
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text('从国家 / 货币（点击切换全球任意国家）',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: pal.secondary)),
            const SizedBox(height: 6),
            GlassPanel(
              isDark: isDark,
              child: _pickerCard(from, true, isDark, pal, green),
            ),
            const SizedBox(height: 12),
            // 交换 + 热门国家一键替换栏
            Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    final t = _fromCode;
                    _fromCode = _toCode;
                    _toCode = t;
                  }),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                        color: pal.accentSoft,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Icon(Icons.swap_horiz,
                            size: 16, color: pal.accent),
                        const SizedBox(width: 6),
                        Text('双向对调国家',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: pal.accent)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _quickCodes.map((quickCode) {
                        final item = _findCurrency(quickCode);
                        final sel = _toCode == quickCode;
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: 6),
                          child: GestureDetector(
                            onTap: () =>
                                setState(() => _toCode = quickCode),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5),
                              decoration: BoxDecoration(
                                  color: sel
                                      ? pal.accent
                                      : pal.subtleFill,
                                  borderRadius:
                                      BorderRadius.circular(999)),
                              child: Text(
                                  '${item.flag} ${item.country}',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: sel
                                          ? Colors.white
                                          : pal.foreground)),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text('到国家 / 货币（点击切换全球任意国家）',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: pal.secondary)),
            const SizedBox(height: 6),
            GlassPanel(
              isDark: isDark,
              child: _pickerCard(
                  to, false, isDark, pal, const Color(0xFFDE2910)),
            ),
            const SizedBox(height: 12),
            // 汇率信息
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                          '1 ${from.country}($_fromCode) ≈ ${_fmt(unitRate)} ${to.country}($_toCode)',
                          style: TextStyle(
                              fontSize: 12.5,
                              fontWeight: FontWeight.bold,
                              color: pal.foreground)),
                    ),
                    Text(_usingOnline ? '实时汇率' : '内置汇率',
                        style: TextStyle(
                            fontSize: 10, color: pal.secondary)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 换算结果
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20, horizontal: 12),
                child: Column(
                  children: [
                    Text(
                      _convertResult(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                          color: pal.accent),
                    ),
                    const SizedBox(height: 6),
                    Text('${from.flag} ${from.country} ⇄ ${to.flag} ${to.country} · 实时换算结果',
                        style: TextStyle(
                            fontSize: 11, color: pal.secondary)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // 操作按钮
            Row(
              children: [
                Expanded(
                  child: CupertinoButton(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10),
                    color: green,
                    borderRadius: BorderRadius.circular(14),
                    onPressed: () => setState(() {}),
                    child: const Text('立即换算',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CupertinoButton(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10),
                    color: pal.accent,
                    borderRadius: BorderRadius.circular(14),
                    onPressed: _loading ? null : _fetchRates,
                    child: Text(_loading ? '同步中…' : '同步全球汇率',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // 全球实时折算一览（点击任意国家立即替换目标货币）
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('🌐 全球实时折算一览（点击任意国家立即替换目标货币）',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: pal.foreground)),
                    const SizedBox(height: 8),
                    ..._currencies.take(12).map((target) {
                      final converted = (amt != null && amt > 0 ? amt : 1.0) /
                          ((_rates[_fromCode] ?? 1.0)) *
                          ((_rates[target.code] ?? 1.0));
                      final sel = target.code == _toCode;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: GestureDetector(
                          onTap: () =>
                              setState(() => _toCode = target.code),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            decoration: BoxDecoration(
                                color: sel
                                    ? pal.accentSoft
                                    : Colors.transparent,
                                borderRadius:
                                    BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Text(target.flag,
                                    style: const TextStyle(
                                        fontSize: 16)),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                      '${target.country} · ${target.currencyName}',
                                      style: TextStyle(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.bold,
                                          color: pal.foreground)),
                                ),
                                Text(
                                    '${target.symbol} ${_fmt(converted)} (${target.code})',
                                    style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.w800,
                                        color: pal.accent)),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
