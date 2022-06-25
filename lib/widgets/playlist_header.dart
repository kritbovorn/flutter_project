import 'package:flutter/material.dart';

import 'package:flutter_project/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;
  const PlaylistHeader({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                playlist.imageURL,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLAYLIST',
                    style: Theme.of(context).textTheme.overline,
                  ),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Created by: ${playlist.creator} • ${playlist.songs.length} songs, ${playlist.duration}',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('PLAY'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.more_horiz),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'FOLLOWERS',
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    playlist.followers,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
