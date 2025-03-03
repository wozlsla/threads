import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

abstract class Source extends StatelessWidget {
  const Source({super.key});

  @override
  Widget build(BuildContext context);
}

class UrlSource extends StatelessWidget implements Source {
  final String url;

  const UrlSource(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
    );
  }
}

// image picker
class FileSource extends StatelessWidget implements Source {
  final XFile file;

  const FileSource(this.file, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.file(
      File(file.path),
      fit: BoxFit.cover,
    );
  }
}
