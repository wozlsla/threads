import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/theme/theme.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _isText = "";

  void _onTap() {
    Navigator.of(context).pop();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
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
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight + 10, // 기본 높이 + bottom 높이
          leadingWidth: 80,
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.primaryBackground,
          leading: TextButton(
            onPressed: _onTap,
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(left: 20.0),
              foregroundColor: Colors.black,
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
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jimnny",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
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
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.paperclip,
                  color: AppColors.charcoaleIcon,
                  size: 20,
                ),
              ),
              Spacer(),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
