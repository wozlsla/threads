import 'package:flutter/widgets.dart';
import 'package:threads/common/theme/theme.dart';
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
    if (sources.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: sources.length,
        separatorBuilder: (context, index) => (Gaps.h8),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size6),
              border: Border.all(
                color: AppColors.charcoaleIcon,
                width: 0.4,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.size6),
              child: sources[index],
            ),
          );
        },
      ),
    );
  }
}
