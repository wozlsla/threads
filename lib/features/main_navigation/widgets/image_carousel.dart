import 'package:flutter/widgets.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls;
  const ImageCarousel({
    super.key,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        separatorBuilder: (context, index) => (Gaps.h8),
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.size10),
            child: Image.network(
              imageUrls[index],
            ),
          );
        },
      ),
    );
  }
}
