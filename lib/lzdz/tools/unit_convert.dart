import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';

/// 单位换算：长度 / 重量 / 温度三类，常用单位双向换算。
/// 移植自懒得找了 UnitConverterSection.kt（v1.4.22）。
class UnitConvertToolPage extends StatefulWidget {
  const UnitConvertToolPage({super.key});

  static const String pageTitle = '单位换算';

  @override
  State<UnitConvertToolPage> createState() => _UnitConvertToolPageState();
}

/// 单位定义：toBase 为换算到基准单位的系数。
class _UnitDef {
  const _UnitDef(this.name, this.toBase);
  final String name;
  final double toBase;
}

const List<_UnitDef> _lengthUnits = [
  _UnitDef('千米 km', 1000.0),
  _UnitDef('米 m', 1.0),
  _UnitDef('分米 dm', 0.1),
  _UnitDef('厘米 cm', 0.01),
  _UnitDef('毫米 mm', 0.001),
  _UnitDef('英里 mi', 1609.344),
  _UnitDef('英尺 ft', 0.3048),
  _UnitDef('英寸 in', 0.0254),
  _UnitDef('里', 500.0),
  _UnitDef('丈', 3.333333),
];

const List<_UnitDef> _weightUnits = [
  _UnitDef('吨 t', 1000.0),
  _UnitDef('千克 kg', 1.0),
  _UnitDef('克 g', 0.001),
  _UnitDef('毫克 mg', 0.000001),
  _UnitDef('斤', 0.5),
  _UnitDef('两', 0.05),
  _UnitDef('磅 lb', 0.45359237),
  _UnitDef('盎司 oz', 0.028349523125),
];

const List<String> _tempUnits = ['摄氏度 ℃', '华氏度 ℉', '开尔文 K'];
const List<String> _categories = ['长度', '重量', '温度'];

/// 去掉小数点后多余的 0（对应 Kotlin 的 trimEnd('0').trimEnd('.')）。
String _trimNum(double v, int digits) {
  var s = v.toStringAsFixed(digits);
  if (s.contains('.')) {
    s = s.replaceAll(RegExp(r'0+$'), '');
    if (s.endsWith('.')) s = s.substring(0, s.length - 1);
  }
  return s;
}

double _convertTemp(double v, int from, int to) {
  final c = from == 0 ? v : (from == 1 ? (v - 32) * 5 / 9 : v - 273.15);
  return to == 0 ? c : (to == 1 ? c * 9 / 5 + 32 : c + 273.15);
}

class _UnitConvertToolPageState extends State<UnitConvertToolPage> {
  int _category = 0; // 0长度 1重量 2温度
  final _inputCtrl = TextEditingController(text: '1');
  int _fromIdx = 1;
  int _toIdx = 3;

  @override
  void dispose() {
    _inputCtrl.dispose();
    super.dispose();
  }

  List<String> get _unitNames {
    if (_category == 2) return _tempUnits;
    return (_category == 0 ? _lengthUnits : _weightUnits)
        .map((u) => u.name)
        .toList();
  }

  String get _result {
    final v = double.tryParse(_inputCtrl.text);
    if (v == null) return '—';
    if (_category == 2) {
      final r = _convertTemp(
          v, _fromIdx.clamp(0, 2).toInt(), _toIdx.clamp(0, 2).toInt());
      return _trimNum(r, 4);
    }
    final units = _category == 0 ? _lengthUnits : _weightUnits;
    final f = units[_fromIdx.clamp(0, units.length - 1).toInt()];
    final t = units[_toIdx.clamp(0, units.length - 1).toInt()];
    return _trimNum(v * f.toBase / t.toBase, 6);
  }

  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    final names = _unitNames;

    return SubPage(
      title: UnitConvertToolPage.pageTitle,
      child: SafeArea(
        child: TopFadeListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
          children: [
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.swap_horiz,
                            color: pal.accent, size: 22),
                        const SizedBox(width: 8),
                        Text('单位换算',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: pal.foreground)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // 分类切换
                    Row(
                      children: List.generate(_categories.length, (i) {
                        final selected = _category == i;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () => setState(() {
                              _category = i;
                              _fromIdx = 0;
                              _toIdx = 1;
                            }),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: selected
                                    ? pal.accentSoft
                                    : Colors.transparent,
                              ),
                              child: Text(
                                _categories[i],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: selected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: selected
                                      ? pal.foreground
                                      : pal.secondary,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 12),
                    CupertinoTextField(
                      controller: _inputCtrl,
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true, signed: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9.\-]'))
                      ],
                      onChanged: (_) => _refresh(),
                      style:
                          TextStyle(fontSize: 14, color: pal.foreground),
                      placeholder: '输入数值',
                      placeholderStyle: TextStyle(
                          fontSize: 12, color: pal.secondary),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: CupertinoColors.systemGrey4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _unitPicker('从', names, _fromIdx, pal,
                        (i) => setState(() => _fromIdx = i)),
                    const SizedBox(height: 8),
                    _unitPicker('到', names, _toIdx, pal,
                        (i) => setState(() => _toIdx = i)),
                  ],
                ),
              ),
            ),
            GlassPanel(
              isDark: isDark,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('换算结果',
                        style: TextStyle(
                            fontSize: 12, color: pal.secondary)),
                    const SizedBox(height: 6),
                    Text(
                      _result,
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: pal.foreground),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _unitPicker(String label, List<String> names, int selected,
      Palette pal, ValueChanged<int> onPick) {
    final safe = selected.clamp(0, names.length - 1).toInt();
    return PopupMenuButton<int>(
      onSelected: onPick,
      itemBuilder: (context) => List.generate(
        names.length,
        (i) => PopupMenuItem<int>(
          value: i,
          child: Text(names[i],
              style: const TextStyle(fontSize: 13)),
        ),
      ),
      child: Container(
        width: double.infinity,
        padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: pal.secondary.withOpacity(0.35)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text('$label：${names[safe]}',
                  style: TextStyle(
                      fontSize: 13, color: pal.foreground),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ),
            Icon(Icons.arrow_drop_down,
                color: pal.secondary, size: 20),
          ],
        ),
      ),
    );
  }
}
