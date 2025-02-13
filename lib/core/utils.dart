import 'dart:math';

String profileImage = "https://avatars.githubusercontent.com/u/62599036?v=4";

String getImage() {
  final random = Random();
  return 'https://picsum.photos/300/200?hash=${random.nextInt(10000)}';
}
