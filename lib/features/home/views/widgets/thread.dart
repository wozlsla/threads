import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads/common/widgets/source.dart';
import 'package:threads/features/home/models/thread_model.dart';

import '../../../../constants/gaps.dart';
import '../../../../common/theme/theme.dart';
import '../../../../utils.dart';
import 'image_carousel.dart';
import 'thread_options_bottom_sheet.dart';
import 'reply_timeline.dart';

class Thread extends StatelessWidget {
  final ThreadModel thread;

  const Thread({
    super.key,
    required this.thread,
  });

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
    final userName = faker.internet.userName(); // for test
    // final userName = thread.authorId;
    final sentence = thread.body;

    final random = RandomGenerator(seed: DateTime.now().millisecondsSinceEpoch);
    final since = random.integer(60);

    final replies = random.integer(4);
    final repliers = List.generate(replies, (index) => getImage());

    final bool isVerified = random.integer(3) != 0;

    final sources =
        thread.imageUrls?.map(toImageURL).map(UrlSource.new).toList();

    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          right: 10.0,
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: ReplyTimeline(
                repliers: repliers,
              ),
            ),
            Expanded(
              flex: 5,
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
                            isVerified
                                ? SvgPicture.asset(
                                    "assets/icons/verified_badge.svg",
                                    width: 15,
                                    height: 15,
                                  )
                                : SizedBox.shrink(),
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
                  if (sources != null) ImageCarousel(sources: sources),
                  Gaps.v12,
                  SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(
                          FontAwesomeIcons.heart,
                          // color: AppColors.primaryIcon,
                          size: 18,
                        ),
                        Icon(
                          FontAwesomeIcons.comment,
                          // color: AppColors.primaryIcon,
                          size: 18,
                        ),
                        Icon(
                          FontAwesomeIcons.repeat,
                          // color: AppColors.primaryIcon,
                          size: 18,
                        ),
                        Icon(
                          FontAwesomeIcons.paperPlane,
                          // color: AppColors.primaryIcon,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  Gaps.v12,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
