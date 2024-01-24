import 'package:e_learning/src/features/myCourses/domain/entities/section_entity.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildLectureItem({
  required BuildContext context,
  required SectionEntity sectionEntity,
  required void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
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
              sectionEntity.isWatched
                  ? Icons.check_circle_outline
                  : Icons.circle_outlined,
              color: HexColor('#0c1c2c'),
              size: 35.0,
            ),
          )
        ],
      ),
    ),
  );
}
