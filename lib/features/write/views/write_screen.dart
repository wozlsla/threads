import 'dart:io';

import 'package:camera/camera.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:threads/common/widgets/source.dart';
import 'package:threads/features/home/view_models/thread_vm.dart';
import 'package:threads/features/home/views/widgets/image_carousel.dart';

import 'package:threads/features/settings/view_models/settings_vm.dart';
import '../../../utils.dart';
import '../../../constants/sizes.dart';
import '../../../common/theme/theme.dart';

import '../../camera/views/camera_screen.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> {
  // List<XFile>? _picture;
  List<Source>? _picture; // UrlSource, FileSource 둘 다 가능하게 수정

  final TextEditingController _textController = TextEditingController();
  final facker = Faker();
  final profile = getImage();
  late String username;

  void _onTap() async {
    await ref.read(threadProvider.notifier).uploadThread(
          body: _textController.text,
          files: _picture
              ?.whereType<FileSource>() // FileSource만 변환
              .map((e) => File(e.file.path))
              .toList(),
        );

    context.pop();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  Future<void> _onClipTap() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CameraScreen(),
      ),
    );

    if (result is List<XFile>) {
      // ✅ 로컬 파일은 FileSource로 변환
      setState(() {
        _picture = result.map((file) => FileSource(file)).toList();
      });
    } else if (result is List<String>) {
      // ✅ 웹 URL인지, 로컬 파일인지 체크 후 Source 변환
      setState(() {
        _picture = result.map((url) {
          return url.startsWith("http")
              ? UrlSource(url)
              : FileSource(XFile(url));
        }).toList();
      });
    } else if (result is String) {
      setState(() {
        // ✅ 단일 URL을 반환받을 경우
        _picture = [
          result.startsWith("http")
              ? UrlSource(result)
              : FileSource(XFile(result))
        ];
      });
    } else if (result == null) {
      debugPrint("User cancelled image selection."); // ✅ 사용자가 취소했을 때
    } else {
      debugPrint(
          "Error: Expected List<XFile> or List<String> but got ${result.runtimeType}");
    }
  }

  @override
  void initState() {
    super.initState();
    username = faker.person.name();

    _textController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(settingsProvider).darkMode;
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
                          profile,
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
                          profile,
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
                              child: CloseButton(
                                onPressed: () => setState(() {
                                  _picture = null;
                                }),
                              ),
                            ),
                          ],
                        ),
                        TextField(
                          controller: _textController,
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
                        _picture != null
                            ? Expanded(
                                child: Stack(
                                  children: [
                                    ImageCarousel(
                                      // sources: _picture!
                                      //     .map(FileSource.new)
                                      //     .toList(),
                                      sources: _picture!,
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 5,
                                      child: GestureDetector(
                                        onTap: () => setState(() {
                                          _picture = null;
                                        }),
                                        child: Icon(
                                          FontAwesomeIcons.solidCircleXmark,
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                    )
                                  ],
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
                onPressed: _onTap,
                child: Text(
                  "Post",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _textController.text.isEmpty
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
