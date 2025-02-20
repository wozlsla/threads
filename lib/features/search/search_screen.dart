import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads/core/utils.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

import '../../models/user_model.dart';
import '../../services/user_serviece.dart';

import 'widgets/search_tile.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = "/search";

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Future<List<UserModel>> _users = UserServiece.loadUsers();

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
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
