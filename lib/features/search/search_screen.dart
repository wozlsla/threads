import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/gaps.dart';
import '../../constants/sizes.dart';
import '../../constants/theme/theme.dart';

import '../../models/user_model.dart';
import '../../services/user_serviece.dart';

import 'widgets/search_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Future<List<UserModel>> _users = UserServiece.loadUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: kToolbarHeight + 35,
        backgroundColor: AppColors.primaryBackground,
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
