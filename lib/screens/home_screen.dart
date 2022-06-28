import 'package:flutter/material.dart';
import 'package:flutter_project/models/following.dart';
import 'package:flutter_project/screens/profile_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListTile eachTile(Following following, String name, String initials) {
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        child: Text(initials),
      ),
      trailing: IconButton(
        icon: (following.followingLists.contains(name))
            ? const Icon(Icons.check)
            : const Icon(Icons.add),
        onPressed: () {
          if (following.followingLists.contains(name)) {
            following.remove(name);
          } else {
            following.add(name);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Following following = Provider.of<Following>(context, f);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider"),
        actions: [
          TextButton(
            child: Text(
              'Next',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ));
            },
          ),
        ],
      ),
      body: Consumer<Following>(
        builder: (context, value, child) => ListView(
          children: [
            eachTile(value, "Elon Musk", "EM"),
            eachTile(value, "Kanye West", "KW"),
            eachTile(value, "Kim Kardashian", "KK"),
            eachTile(value, "Kobe Bryant", "KB"),
            eachTile(value, "Tom Hanks", "TH"),
            eachTile(value, "Lebron James", "LJ"),
            eachTile(value, "Michael Jordan", "MJ"),
            eachTile(value, "Joe Rogan", "JR"),
            eachTile(value, "Selena Gomez", "SG"),
            eachTile(value, "Oprah Winfrey", "OW"),
          ],
        ),
      ),
    );
  }
}
