import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/library_playlist_widget.dart';
import 'package:flutter_project/widgets/widgets.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: const [
          LogoImageWidget(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: SideMenuIconWidgets(),
          ),
          Expanded(
            child: LibraryPlaylistWidget(),
          ),
        ],
      ),
    );
  }
}
