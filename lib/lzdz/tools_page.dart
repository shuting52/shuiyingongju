import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jicun/ui/glass.dart';
import 'package:jicun/ui/palette.dart';

import 'tools_data.dart';
import 'tools/mouthpiece.dart';
import 'tools/age_calc.dart';
import 'tools/offline_treasure.dart';
import 'tools/food_picker.dart';
import 'tools/emergency_phone.dart';
import 'tools/license_plate.dart';
import 'tools/cold_joke.dart';
import 'tools/speed_test.dart';
import 'tools/currency.dart';
import 'tools/period.dart';
import 'tools/worktime.dart';
import 'tools/ip_check.dart';
import 'tools/car_brand.dart';
import 'tools/image_prompts.dart';
import 'tools/qr_gen.dart';
import 'tools/password_gen.dart';
import 'tools/unit_convert.dart';
import 'tools/bmi.dart';
import 'tools/countdown.dart';
import 'tools/random_draw.dart';
import 'tools/music_player.dart';

/// 工具箱:移植自 10-05landezhaole(懒得找了) 工具箱.
/// 21 个小工具,点卡片进独立页面。
class ToolsView extends StatelessWidget {
  const ToolsView({super.key});

  Widget _pageFor(String id) {
    switch (id) {
      case 'mouthpiece':
        return const MouthpieceToolPage();
      case 'age_calc':
        return const AgeCalcToolPage();
      case 'offline_treasure':
        return const OfflineTreasureToolPage();
      case 'food_picker':
        return const FoodPickerToolPage();
      case 'emergency_phone':
        return const EmergencyPhoneToolPage();
      case 'license_plate':
        return const LicensePlateToolPage();
      case 'cold_joke':
        return const ColdJokeToolPage();
      case 'speed_test':
        return const SpeedTestToolPage();
      case 'currency':
        return const CurrencyToolPage();
      case 'period':
        return const PeriodToolPage();
      case 'worktime':
        return const WorktimeToolPage();
      case 'ip_check':
        return const IpCheckToolPage();
      case 'car_brand':
        return const CarBrandToolPage();
      case 'image_prompts':
        return const ImagePromptsToolPage();
      case 'qr_generator':
        return const QrGenToolPage();
      case 'password_gen':
        return const PasswordGenToolPage();
      case 'unit_convert':
        return const UnitConvertToolPage();
      case 'bmi_calc':
        return const BmiToolPage();
      case 'countdown':
        return const CountdownToolPage();
      case 'random_draw':
        return const RandomDrawToolPage();
      case 'music_player':
        return const MusicPlayerToolPage();
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final pal = Palette.of(isDark);
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(20, 4, 20, 120),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.05,
      ),
      itemCount: kLzTools.length,
      itemBuilder: (context, i) {
        final t = kLzTools[i];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => _pageFor(t.id)),
            );
          },
          child: GlassPanel(
            isDark: isDark,
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(t.icon, color: pal.foreground, size: 26),
                  const Spacer(),
                  Text(
                    t.shortLabel,
                    style: TextStyle(
                      color: pal.foreground,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    t.desc,
                    style: TextStyle(color: pal.secondary, fontSize: 11),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
