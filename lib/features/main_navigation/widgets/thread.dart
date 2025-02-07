import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/gaps.dart';
import '../../../constants/theme/theme.dart';
import '../../../core/utils.dart';
import 'image_carousel.dart';
import 'thread_options_bottom_sheet.dart';

class Thread extends StatelessWidget {
  const Thread({super.key});

  void _onOptionsTap(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // barrierColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: ThreadOptionsBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final faker = Faker();
    final userName = faker.internet.userName();
    final sentence = faker.lorem.sentence();

    final random = RandomGenerator(seed: DateTime.now().millisecondsSinceEpoch);
    final since = random.integer(60);

    final imgLength = random.integer(3) + 1;
    final hasImage = random.integer(3) == 0;

    final images = List.generate(imgLength, (index) => getImage());

    return IntrinsicHeight(
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        // mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            userName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.h5,
                          Stack(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/verified.svg',
                                width: 15,
                                height: 15,
                                colorFilter: ColorFilter.mode(
                                  AppColors.verifiedBadge,
                                  BlendMode.srcIn,
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/icons/check.svg',
                                width: 15,
                                height: 15,
                                colorFilter: ColorFilter.mode(
                                  AppColors.primaryBackground,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "${since}m",
                          style: TextStyle(
                            color: AppColors.secondaryIcon,
                          ),
                        ),
                        Gaps.h12,
                        GestureDetector(
                          onTap: () => _onOptionsTap(context),
                          child: const Icon(
                            FontAwesomeIcons.ellipsis,
                            size: 16,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Text(
                  sentence,
                  style: TextStyle(fontSize: 16),
                ),
                Gaps.v8,
                if (hasImage) ImageCarousel(imageUrls: images),
                Gaps.v12,
                SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        FontAwesomeIcons.heart,
                        color: AppColors.primaryIcon,
                        size: 18,
                      ),
                      Icon(
                        FontAwesomeIcons.comment,
                        color: AppColors.primaryIcon,
                        size: 18,
                      ),
                      Icon(
                        FontAwesomeIcons.repeat,
                        color: AppColors.primaryIcon,
                        size: 18,
                      ),
                      Icon(
                        FontAwesomeIcons.paperPlane,
                        color: AppColors.primaryIcon,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                Gaps.v12,
                Text("likes data"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
