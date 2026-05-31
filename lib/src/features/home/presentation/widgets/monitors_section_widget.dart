import '../../../../core/utils/consts/screen_sizes.dart';
import '../../../../core/utils/widgets/app_widgets.dart';
import '../../domain/entities/monitors_entity.dart';
import '../pages/home_screen/cubit/home_screen_cubit.dart';
import 'monitors_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

SizedBox buildMonitorsSection(
  BuildContext context,
) {
  List<MonitorEntity> monitors = HomeScreenCubit.get(context).monitors;
  return SizedBox(
    height: 80.h,
    child: ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return buildMonitorsCard(context, monitors[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 16.w);
      },
      itemCount: monitors.length,
    ),
  );
}
