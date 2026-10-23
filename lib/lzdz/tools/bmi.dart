import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';

/// BMI 健康计算：输入身高体重，计算 BMI 指数并给出健康分级与建议。
/// 移植自懒得找了 BmiSection.kt（v1.4.22）。
class BmiToolPage extends StatefulWidget {
  const BmiToolPage({super.key});

  static const String pageTitle = 'BMI计算';

  @override
  State<BmiToolPage> createState() => _BmiToolPageState();
}

class _BmiToolPageState extends State<BmiToolPage> {
  final _heightCtrl = TextEditingController();
  final _weightCtrl = TextEditingController();
  double? _bmi;

  @override
  void dispose() {
    _heightCtrl.dispose();
    _weightCtrl.dispose();
    super.dispose();
  }

  void _calc() {
    final h = double.tryParse(_heightCtrl.text);
    final w = double.tryParse(_weightCtrl.text);
    setState(() {
      _bmi = (h != null && w != null && h > 50 && h < 250 && w > 10 && w < 300)
          ? w / ((h / 100) * (h / 100))
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);

    final bmi = _bmi;
    String level = '';
    String advice = '';
    if (bmi != null) {
      if (bmi < 18.5) {
        level = '偏瘦';
        advice = '建议加强营养，适当增肌，规律三餐';
      } else if (bmi < 24) {
        level = '正常';
        advice = '保持得很好！继续规律作息和运动';
      } else if (bmi < 28) {
        level = '超重';
        advice = '建议控制饮食、增加有氧运动';
      } else {
        level = '肥胖';
        advice = '建议咨询医生，制定科学减重计划';
      }
    }

    return SubPage(
      title: BmiToolPage.pageTitle,
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
                        Icon(Icons.monitor_weight,
                            color: pal.accent, size: 22),
                        const SizedBox(width: 8),
                        Text('BMI 健康计算',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: pal.foreground)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('身体质量指数 = 体重(kg) ÷ 身高(m)²',
                        style:
                            TextStyle(fontSize: 12, color: pal.secondary)),
                    const SizedBox(height: 12),
                    CupertinoTextField(
                      controller: _heightCtrl,
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9.]'))
                      ],
                      style:
                          TextStyle(fontSize: 14, color: pal.foreground),
                      placeholder: '身高（厘米） · 如：170',
                      placeholderStyle: TextStyle(
                          fontSize: 13, color: pal.secondary),
                    ),
                    const SizedBox(height: 8),
                    CupertinoTextField(
                      controller: _weightCtrl,
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9.]'))
                      ],
                      style:
                          TextStyle(fontSize: 14, color: pal.foreground),
                      placeholder: '体重（千克） · 如：65',
                      placeholderStyle: TextStyle(
                          fontSize: 13, color: pal.secondary),
                    ),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: _calc,
                      style: FilledButton.styleFrom(
                        backgroundColor: pal.accent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('计算 BMI',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                  ],
                ),
              ),
            ),
            if (bmi != null)
              GlassPanel(
                isDark: isDark,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('你的 BMI',
                          style: TextStyle(
                              fontSize: 12, color: pal.secondary)),
                      const SizedBox(height: 4),
                      Text(bmi.toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: 44,
                              fontWeight: FontWeight.w900,
                              color: pal.foreground)),
                      Text(level,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: pal.foreground)),
                      const SizedBox(height: 12),
                      // 参考条：15 ~ 35
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: LinearProgressIndicator(
                          value: ((bmi - 15) / 20).clamp(0.0, 1.0).toDouble(),
                          minHeight: 10,
                          backgroundColor:
                              pal.secondary.withOpacity(0.25),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(pal.accent),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: ['15', '18.5', '24', '28', '35+']
                            .map((t) => Text(t,
                                style: TextStyle(
                                    fontSize: 10,
                                    color: pal.secondary)))
                            .toList(),
                      ),
                      const SizedBox(height: 10),
                      Text(advice,
                          style: TextStyle(
                              fontSize: 13,
                              color: pal.foreground,
                              height: 1.5)),
                      const SizedBox(height: 6),
                      Text('仅供参考，身体不适请及时就医',
                          style: TextStyle(
                              fontSize: 11, color: pal.secondary)),
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
