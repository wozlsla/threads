import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/features/settings/view_models/settings_vm.dart';
import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

import '../models/user_model.dart';
import '../services/user_serviece.dart';

import 'widgets/search_tile.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static const routeName = "search";
  static const routeURL = "/search";

  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final Future<List<UserModel>> _users = UserServiece.loadUsers();

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(settingsProvider).darkMode;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: kToolbarHeight + 35,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search",
              style: TextStyle(
                fontSize: Sizes.size28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.v12,
            CupertinoSearchTextField(
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
              // decoration: BoxDecoration(
              //   color: Colors.grey.shade200,
              //   borderRadius: const BorderRadius.all(
              //     Radius.circular(10),
              //   ),
              // ),
              // prefixIcon: const Icon(
              //   Icons.search,
              //   color: Colors.grey,
              // ),
              // placeholder: "Search",
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: _users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 0.3,
                thickness: 0.3,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => SearchTile(
                user: snapshot.data![index],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
