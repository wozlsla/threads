import 'package:flutter/widgets.dart';
import 'package:threads/common/widgets/source.dart';

import '../../../../constants/gaps.dart';
import '../../../../constants/sizes.dart';

class ImageCarousel extends StatelessWidget {
  final List<Source> sources;

  const ImageCarousel({
    super.key,
    required this.sources,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sources.length,
        separatorBuilder: (context, index) => (Gaps.h8),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.size10),
            child: sources[index],
          );
        },
      ),
    );
  }
}
