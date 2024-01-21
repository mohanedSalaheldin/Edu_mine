import 'package:e_learning/src/core/entities/my_courses_entity.dart';
import 'package:e_learning/src/core/utils/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildMyCouseCard({
  required double height,
  required BuildContext context,
  required void Function()? onTap,
  required CourseEntity courseEntity,
  bool isMyCourse = true,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            15.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsetsDirectional.all(10.0),
            height: height / 4,
            // color: HexColor('#0c1c2c'),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  // bottomLeft: Radius.circular(15.0),
                  // bottomRight: Radius.circular(15.0),
                  ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  HexColor('#23629f'),
                  HexColor('#21659e'),
                  HexColor('#0d9699'),
                ],
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.wifi_tethering_outlined,
                  color: Colors.white,
                  size: 35.0,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: (height - (height / 4)),
            padding: const EdgeInsetsDirectional.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                horizentalGab(val: double.infinity),
                Text(
                  courseEntity.tag,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 18.0,
                      ),
                ),
                vericalGab(val: 5),
                Text(
                  courseEntity.courseName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 22.0,
                      ),
                ),
                vericalGab(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 15,
                          child: Icon(
                            Icons.wallet,
                            size: 20.0,
                          ),
                        ),
                        horizentalGab(),
                        Text(
                          courseEntity.instructor,
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_outlined,
                          color: HexColor('#f0ac79'),
                        ),
                        Text(
                          courseEntity.rate,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                              ),
                        ),
                        Text(
                          "(${courseEntity.reviews} Reviews)",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.0,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
                vericalGab(),
                Row(
                  children: [
                    Text(
                      isMyCourse
                          ? "${courseEntity.doneSections}/${courseEntity.allSections}"
                          : '18 Section',
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                    ),
                    const Spacer(),
                    isMyCourse
                        ? Row(
                            children: [
                              SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: CircularProgressIndicator.adaptive(
                                  value: .60,
                                  valueColor: AlwaysStoppedAnimation(
                                      HexColor('#2ba3a5')),
                                ),
                              ),
                              horizentalGab(val: 5),
                              Text(
                                '${((courseEntity.doneSections / courseEntity.allSections) * 100).toInt()}%',
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                      color: HexColor('#2ba3a5'),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
