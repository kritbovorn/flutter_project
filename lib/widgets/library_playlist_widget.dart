import 'package:flutter/material.dart';
import 'package:flutter_project/data/data.dart';

class LibraryPlaylistWidget extends StatefulWidget {
  const LibraryPlaylistWidget({Key? key}) : super(key: key);

  @override
  State<LibraryPlaylistWidget> createState() => _LibraryPlaylistWidgetState();
}

class _LibraryPlaylistWidgetState extends State<LibraryPlaylistWidget> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      controller: _scrollController,
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        physics: const ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Text(
                  'YOUR LIBRARY',
                  style: Theme.of(context).textTheme.headline4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...yourLibrary
                  .map(
                    (e) => ListTile(
                      dense: true,
                      title: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {},
                    ),
                  )
                  .toList(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Text(
                    'PLAYLISTS',
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists
                    .map(
                      (e) => ListTile(
                        dense: true,
                        title: Text(
                          e,
                          style: Theme.of(context).textTheme.bodyText2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {},
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
