import 'package:flutter/material.dart';
import 'package:flutter_project/data/data.dart';
import 'package:flutter_project/screens/playlist_screen.dart';
import 'package:flutter_project/widgets/widgets.dart';

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800) const SideMenu(),
                const Expanded(
                  child: PlaylistScreen(
                    playlist: lofihiphopPlaylist,
                  ),
                ),
              ],
            ),
          ),
          const CurrentTrack(),
        ],
      ),
    );
  }
}
