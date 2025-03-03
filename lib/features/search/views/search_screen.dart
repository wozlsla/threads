import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/features/settings/view_models/settings_vm.dart';
import 'package:threads/features/users/view_models/user_vm.dart';
import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

import 'widgets/search_tile.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static const routeName = "search";
  static const routeURL = "/search";

  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(settingsProvider).darkMode;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: kToolbarHeight + 50,
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
              controller: _searchController,
              autocorrect: false,
              padding: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 4.0,
              ),
              cursorColor: Colors.blue.shade800,
              cursorRadius: Radius.circular(6.0),
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontSize: 14.0,
              ),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade900 : Colors.grey.shade200,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Icon(
                  Icons.search,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              // placeholder: "Search",
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Gaps.v4,
          FutureBuilder(
            future: ref
                .watch(usersProvider.notifier)
                .searchUsers(_searchController.value.text),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Flexible(
                  child: ListView.separated(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) =>
                        SearchTile(user: snapshot.data![index]),
                    separatorBuilder: (context, index) => Divider(
                      height: 0,
                      thickness: 0.5,
                      indent: 72,
                    ),
                  ),
                );
              } else {
                return CircularProgressIndicator.adaptive();
              }
            },
          ),
        ],
      ),
    );
  }
}
