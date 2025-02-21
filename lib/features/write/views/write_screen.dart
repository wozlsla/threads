import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../common/utils.dart';
import '../../../constants/sizes.dart';
import '../../../common/theme/theme.dart';

import '../../camera/views/camera_screen.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _isText = "";
  List<String> images = [];
  final bool isPicked = false;

  void _onTap() {
    Navigator.of(context).pop();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  Future<void> _onClipTap() async {
    final imagePath = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CameraScreen(),
      ),
    );

    if (imagePath != null) images.add(imagePath);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        _isText = _textEditingController.text;
        // print(_isText);
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight + 8, // 기본 높이 + bottom 높이
          leadingWidth: 80,
          scrolledUnderElevation: 0,
          backgroundColor: isDark ? Colors.grey.shade900 : null,
          leading: TextButton(
            onPressed: _onTap,
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(left: 20.0),
              // foregroundColor: Colors.black,
            ),
            child: Text(
              "Cancle",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          title: Text(
            "New thread",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Divider(
              height: 0.2,
              thickness: 0.2,
              color: AppColors.secondaryIcon,
            ),
          ),
        ),
        body: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              // bottom: 56,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CircleAvatar(
                        foregroundImage: NetworkImage(
                          profileImage,
                        ),
                        radius: 24,
                      ),
                      Expanded(
                        child: VerticalDivider(
                          width: Sizes.size32,
                          thickness: 1,
                          color: AppColors.charcoaleIcon,
                          indent: 8,
                          endIndent: 8,
                        ),
                      ),
                      CircleAvatar(
                        foregroundImage: NetworkImage(
                          profileImage,
                        ),
                        radius: 16,
                      ),
                    ],
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
                            Text(
                              "Jimnny",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Opacity(
                              opacity: 0.4,
                              child: CloseButton(),
                            ),
                          ],
                        ),
                        TextField(
                          controller: _textEditingController,
                          cursorColor: AppColors.verifiedBadge,
                          maxLines: null, // 자동 줄바꿈 활성화
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: "Start a thread...",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondaryIcon,
                            ),
                            border: InputBorder.none, // 언더라인 제거
                          ),
                        ),
                        images.isNotEmpty
                            ? Container(
                                height: 200,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.secondaryIcon, // 테두리
                                    width: 0.2,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(images[0]),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                        IconButton(
                          onPressed: _onClipTap,
                          icon: FaIcon(
                            FontAwesomeIcons.paperclip,
                            color: AppColors.charcoaleIcon,
                            size: 20,
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Anyone can reply",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.secondaryIcon,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Post",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _isText.isEmpty
                        ? AppColors.verifiedBadge.withValues(alpha: 0.5)
                        : AppColors.verifiedBadge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
