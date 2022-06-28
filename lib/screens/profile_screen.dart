import 'package:flutter/material.dart';
import 'package:flutter_project/models/following.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Consumer<Following>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.followingLists.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const Padding(
                padding: EdgeInsets.all(40),
                child: Text("You are following: "),
              );
            }
            return Center(  
              child: Text(value.followingLists[index - 1]),
            );
          },
        ),
      ),
    );
  }
}
