import 'package:e_learning/src/features/myCourses/domain/entities/section_entity.dart';
import 'package:flutter/material.dart';

Row buildLectureItem(BuildContext context, SectionEntity sectionEntity) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          sectionEntity.number.toString(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
        ),
      ),
      Expanded(
        // width: ScreenSizes.getWidth(context) - 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectionEntity.title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
            ),
            Text(
              sectionEntity.description,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  // fontWeight: FontWeight.w500,
                  // fontSize: 22,
                  ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Icon(
          Icons.check_circle_outline_outlined,
          color: sectionEntity.isWatched ? Colors.green : Colors.grey,
        ),
      )
    ],
  );
}
