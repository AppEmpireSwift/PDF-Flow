import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/extensions.dart';

import '../../../../style/style.dart';
import '../../common/round_checkbox.dart';

enum Weekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  static Weekday fromInt(int i) {
    if (i < 1 || i > 7) {
      throw ArgumentError('weekday must be in 1..7');
    }
    return Weekday.values[i - 1];
  }

  int toInt() => index + 1;

  String get shortName => name.substring(0, 3).capitalizeFirst;
}

class WeekStats extends StatelessWidget {
  final List<bool?> weekStats;
  const WeekStats({super.key, required this.weekStats});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18).r,
        color: ColorStyles.indigoWithOpacity,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Daily training', style: TextStyles.title3Emphasized),
          SizedBox(height: 16.r),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              7,
              (i) => TrainingDayItem(
                weekday: Weekday.fromInt(i + 1),
                trained: weekStats.tryIndex(i),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrainingDayItem extends StatelessWidget {
  final bool? trained;
  final Weekday weekday;

  const TrainingDayItem({super.key, this.trained, required this.weekday});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TristateRoundCheckbox(size: 22.r, value: trained, onChanged: (_) {}),
        SizedBox(height: 4.r),
        Text(
          weekday.shortName,
          style: TextStyles.subheadlineRegular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
